import 'package:breakingbad_project/business_logic/auth_bloc/auth_bloc.dart';
import 'package:breakingbad_project/business_logic/auth_bloc/auth_event.dart';
import 'package:breakingbad_project/business_logic/auth_bloc/auth_state.dart';
import 'package:breakingbad_project/business_logic/characters_cubit.dart';
import 'package:breakingbad_project/constants/colors.dart';
import 'package:breakingbad_project/presentation/widgets/character_item.dart';
import 'package:breakingbad_project/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/characters.dart';
import '../../data/repository/auth_repositories.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Character> allCharacters = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.mYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.mGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharacters.length,
      itemBuilder: (ctx, index) {
        return CharacterItem(
          character: allCharacters[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.mYellow,
        title: const Text(
          'Characters',
          style: TextStyle(color: MyColors.mGrey),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: (){
                context.read<AuthBloc>().add(LoggedOut());
              },
              icon: const Icon(
                Icons.logout,
                color: MyColors.mGrey,
              ))
        ],
      ),
      body: buildBlocWidget(),
    );
  }
}

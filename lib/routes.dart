import 'package:breakingbad_project/business_logic/characters_cubit.dart';
import 'package:breakingbad_project/constants/colors.dart';
import 'package:breakingbad_project/data/repository/auth_repositories.dart';
import 'package:breakingbad_project/data/repository/characters_repository.dart';
import 'package:breakingbad_project/presentation/screens/auth/login_screen.dart';
import 'package:breakingbad_project/presentation/screens/character_details_screen.dart';
import 'package:breakingbad_project/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/auth_bloc/auth_bloc.dart';
import 'business_logic/auth_bloc/auth_state.dart';
import 'constants/strings.dart';
import 'data/dio/characters_dio.dart';
import 'data/models/characters.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  late UserRepository userRepository;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersDio());
    charactersCubit = CharactersCubit(charactersRepository);
    userRepository = UserRepository();
  }
  Route? generateRote(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),
            child: WrapperAuth(
              userRepository: userRepository,
            ),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(character: character));
      default:
    }
    return null;
  }
}

class WrapperAuth extends StatelessWidget {
  final UserRepository userRepository;
  const WrapperAuth({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          return const CharactersScreen();
        }
        if (state is AuthUnAuthenticated) {
          return LoginScreen(userRepository: userRepository);
        }
        if (state is AuthLoading) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(MyColors.mainColor),
                      strokeWidth: 4.0,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Scaffold(
          body: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                SizedBox(
                  height: 25.0,
                  width: 25.0,
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(MyColors.mainColor),
                    strokeWidth: 4.0,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

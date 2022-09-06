import 'package:breakingbad_project/business_logic/characters_cubit.dart';
import 'package:breakingbad_project/data/repository/characters_repository.dart';
import 'package:breakingbad_project/presentation/screens/character_details_screen.dart';
import 'package:breakingbad_project/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/strings.dart';
import 'data/dio/characters_dio.dart';
import 'data/models/characters.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersDio());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRote(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),
            child: const CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(character : character));
      default:
    }
    return null;
  }
}

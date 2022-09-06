import 'package:breakingbad_project/data/dio/characters_dio.dart';
import '../models/characters.dart';

class CharactersRepository {
  final CharactersDio charactersDio;

  CharactersRepository(this.charactersDio);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersDio.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}

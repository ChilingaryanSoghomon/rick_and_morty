

import 'package:ric_and_morty/feature/characters/domain/entities/character/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getAllCharacter(int page);

  Future<List<Character>> searchPerson(String query);
}


import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:ric_and_morty/core/error/exception.dart';
import 'package:ric_and_morty/feature/characters/domain/entities/character/character.dart';

abstract class HiveBox {
  static const String character = 'person_list';
}

abstract class CharacterLocalDataSource {
  void characterToCache(List<Character> character);

  Future<List<Character>> getLastCharactersFromCache();
}

class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  final Box<List<String>> hiveBox;
  CharacterLocalDataSourceImpl({required this.hiveBox});


  @override
  Future<List<Character>> getLastCharactersFromCache() async {
    final jsonCharactersList = hiveBox.get(HiveBox.character);
    if (jsonCharactersList!.isNotEmpty) {
      return jsonCharactersList
          .map((person) => Character.fromJson(json.decode(person)))
          .toList();
    } else {
      throw CacheException();
    }
  }

  @override
  void characterToCache(List<Character> character) {
    final List<String> jsonCharactersList =
        character.map((person) => json.encode(person.toJson())).toList();
    hiveBox.put(HiveBox.character, jsonCharactersList);
  }
}

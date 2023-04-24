// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:ric_and_morty/characters/domain/entities/character/character.dart';
import 'package:ric_and_morty/core/error/exception.dart';

abstract class HiveBox{
  static const String character = 'person_list';
}



class CharacterLocalDataSource {
  Box<List<String>> hiveBox;
  CharacterLocalDataSource({required this.hiveBox});

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

  void characterToCache(List<Character> character) {
    final List<String> jsonCharactersList =
        character.map((person) => json.encode(person.toJson())).toList();
    hiveBox.put(HiveBox.character, jsonCharactersList);
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ric_and_morty/characters/domain/entities/character/character.dart';
import 'package:ric_and_morty/core/error/exception.dart';

abstract class RickAndMortApi {
  static const String personPage =
      'https://rickandmortyapi.com/api/character/?page=';
  static const String personQuery =
      'https://rickandmortyapi.com/api/character/?name=';
}

class CharacterRemoteDataSource {
  factory CharacterRemoteDataSource() {
    return _instance;
  }
  CharacterRemoteDataSource._internal();
  static final CharacterRemoteDataSource _instance =
      CharacterRemoteDataSource._internal();

  Future<List<Character>> getAllCharacter(int page) =>
      _getCharacterFromUrl('${RickAndMortApi.personPage}$page');

  Future<List<Character>> searchCharacter(String query) =>
      _getCharacterFromUrl('${RickAndMortApi.personQuery}$query');

  Future<List<Character>> _getCharacterFromUrl(String url) async {
    final response = await http
        .get(Uri.parse(url))
        .then((value) => Future.delayed(const Duration(seconds: 7)));
    if (response.statusCode == 200) {
      final persons = json.decode(response.body);
      return (persons['results'] as List)
          .map((person) => Character.fromJson(person))
          .toList();
    } else {
      throw ServerException();
    }
  }
}

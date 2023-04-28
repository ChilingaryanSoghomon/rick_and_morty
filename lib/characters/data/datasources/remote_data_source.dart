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

abstract class CharacterRemoteDataSource {
  Future<List<Character>> getAllCharacter(int page);
  Future<List<Character>> searchCharacter(String query);
}

class CharacterRemoteDataSourceIm implements CharacterRemoteDataSource {
  factory CharacterRemoteDataSourceIm() {
    return _instance;
  }
  CharacterRemoteDataSourceIm._internal();
  static final CharacterRemoteDataSourceIm _instance =
      CharacterRemoteDataSourceIm._internal();

  @override
  Future<List<Character>> getAllCharacter(int page) =>
      _getCharacterFromUrl('${RickAndMortApi.personPage}$page');

  @override
  Future<List<Character>> searchCharacter(String query) =>
      _getCharacterFromUrl('${RickAndMortApi.personQuery}$query');

  Future<List<Character>> _getCharacterFromUrl(String url) async {
    final response = await http.get(Uri.parse(url));
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

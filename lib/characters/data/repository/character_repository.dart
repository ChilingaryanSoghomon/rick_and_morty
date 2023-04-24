// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ric_and_morty/characters/data/datasources/local_data_source.dart';
import 'package:ric_and_morty/characters/data/datasources/remote_data_source.dart';
import 'package:ric_and_morty/characters/domain/entities/character/character.dart';
import 'package:ric_and_morty/core/platform/network_info.dart';

class CharacterRepository {
  final CharacterLocalDataSource localDataSource;
  final CharacterRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  CharacterRepository({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  
  Future<List<Character>> getAllCharacter(int page) async {
    if (await networkInfo.isConnected) {
      final character = await remoteDataSource.getAllCharacter(page);
      localDataSource.characterToCache(character);
      return character;
    }
    return await localDataSource.getLastCharactersFromCache();
  }

  Future<List<Character>> searchPerson(String query) async {
    if (await networkInfo.isConnected) {
      try {
        return remoteDataSource.searchCharacter(query);
      } catch (e) {
        rethrow;
      }
    }
    return await localDataSource.getLastCharactersFromCache();
  }
}

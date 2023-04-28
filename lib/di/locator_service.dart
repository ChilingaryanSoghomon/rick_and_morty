import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ric_and_morty/core/platform/network_info.dart';
import 'package:ric_and_morty/feature/characters/data/datasources/local_data_source.dart';
import 'package:ric_and_morty/feature/characters/data/repository/character_repository.dart';

import '../feature/characters/data/datasources/remote_data_source.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async {
  final box = await Hive.openBox<List<String>>(HiveBox.character);

  getIt.registerLazySingleton(() => CharacterRepositoryIm(
        localDataSource: getIt<CharacterLocalDataSourceImpl>(),
        networkInfo: getIt<NetworkInfo>(),
        remoteDataSource: getIt<CharacterRemoteDataSourceImpl>(),
      ));
  getIt.registerLazySingleton(
    () => CharacterLocalDataSourceImpl(hiveBox: box),
  );
  getIt.registerLazySingleton(() => NetworkInfo(
        connectionChecker: getIt<InternetConnectionChecker>(),
      ));

  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton(() => CharacterRemoteDataSourceImpl());
}

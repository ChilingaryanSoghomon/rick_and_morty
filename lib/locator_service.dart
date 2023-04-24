import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ric_and_morty/characters/data/datasources/local_data_source.dart';
import 'package:ric_and_morty/characters/data/datasources/remote_data_source.dart';
import 'package:ric_and_morty/characters/data/repository/character_repository.dart';
import 'package:ric_and_morty/core/platform/network_info.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async {
  final box = await Hive.openBox<List<String>>(HiveBox.character);

  getIt.registerLazySingleton(() => CharacterRepository(
        localDataSource: getIt<CharacterLocalDataSource>(),
        networkInfo: getIt<NetworkInfo>(),
        remoteDataSource: getIt<CharacterRemoteDataSource>(),
      ));
  getIt.registerLazySingleton(
    () => CharacterLocalDataSource(hiveBox: box),
  );
  getIt.registerLazySingleton(() => NetworkInfo(
        getIt<InternetConnectionChecker>(),
      ));

  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton(() => CharacterRemoteDataSource());

 final a = getIt.registerSingleton(
      () => InternetConnectionChecker().onStatusChange.listen((status) {
            // if (status == InternetConnectionStatus.disconnected) {
            //   _scaffoldKey.currentState.showSnackBar(
            //     SnackBar(
            //       content: Text('No internet connection'),
            //       duration: Duration(seconds: 5),
            //     ),
            //   );
            // }

            
          }));
}

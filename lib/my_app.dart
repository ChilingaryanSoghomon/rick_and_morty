import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ric_and_morty/feature/characters/data/repository/character_repository.dart';
import 'package:ric_and_morty/feature/characters/presentation/bloc/character_bloc.dart';
import 'package:ric_and_morty/feature/internet_connection/cubit/internet_connection_cubit.dart';
import 'package:ric_and_morty/feature/internet_connection/widget/internet_connection_widget.dart';
import 'package:ric_and_morty/di/locator_service.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CharacterBloc(characterRepository: getIt<CharacterRepositoryIm>())
                ..add(const CharacterLoadingPageEvent()),
        ),
        BlocProvider(
          create: (context) => InternetConnectionCubit(
              internetConnectionChecker: getIt<InternetConnectionChecker>()),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          textTheme: const TextTheme(),
        ),
        home: const SneckBarWidget(),
      ),
    );
  }
}

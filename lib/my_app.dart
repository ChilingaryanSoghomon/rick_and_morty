import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ric_and_morty/characters/data/repository/character_repository.dart';
import 'package:ric_and_morty/characters/presentation/bloc/character_bloc.dart';
import 'package:ric_and_morty/characters/presentation/screens/home_page.dart';
import 'package:ric_and_morty/locator_service.dart';



final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();


class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CharacterBloc(characterRepository: getIt<CharacterRepository>())
            ..add( const CharacterLoadingPageEvent()),
      child: MaterialApp(
        scaffoldMessengerKey: _scaffoldKey,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          textTheme: const TextTheme(),
        ),
        home:  const HomePage(),
      ),
    );
  }
}




  //  InternetConnectionChecker().onStatusChange.listen((status) {
  //   if (status == InternetConnectionStatus.disconnected) {
  //     _scaffoldMessengerKey.currentState.showSnackBar(
  //       SnackBar(
  //         content: Text('No internet connection'),
  //         duration: Duration(seconds: 5),
  //       ),
  //     );
  //   }
  // });
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ric_and_morty/feature/characters/presentation/screens/home_page.dart';
import 'package:ric_and_morty/feature/internet_connection/cubit/internet_connection_cubit.dart';
import 'package:ric_and_morty/my_app.dart';

class SneckBarWidget extends StatelessWidget {
  const SneckBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetConnectionCubit, InternetStatusState>(
      listener: (context, state) {
        if (state == InternetStatusState.disconnected) {
          scaffoldMessengerKey.currentState!.showSnackBar(
            const SnackBar(
              backgroundColor: Colors.black,
              content: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'No internet connection',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              duration: Duration(seconds: 10),
            ),
          );
        }
      },
      child: const HomePage(),
    );
  }
}

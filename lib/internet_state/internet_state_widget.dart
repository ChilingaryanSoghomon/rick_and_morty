
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ric_and_morty/internet_state/bloc/internet_bloc.dart';

class InternetStateWidget extends StatelessWidget {
  const InternetStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is InternetDisConnectState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Counter incremented'),
                duration: Duration(seconds: 10),
              ),
            );
          } else if (state is InternetState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Counter decremented'),
                duration: Duration(seconds: 10),
              ),
            );
          }
        },
    );
  }
}
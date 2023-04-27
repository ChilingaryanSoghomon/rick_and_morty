
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:ric_and_morty/characters/presentation/screens/home_page.dart';
import 'package:ric_and_morty/internet_connection/cubit/internet_connection_cubit.dart';
import 'package:ric_and_morty/my_app.dart';


class SneckBarWidget extends StatelessWidget {
  const SneckBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetConnectionCubit, InternetStatus>(
      listener: (context, state) {
        if (state == InternetStatus.disconnected) {
          scaffoldMessengerKey.currentState!.showSnackBar(
            const SnackBar(
              content: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'No internet connection',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              duration: Duration(seconds: 5),
            ),
          );
        }
      },
      child: const HomePage(),
    );
  }
}


// class InternetConnectionWidget extends StatelessWidget {
//   final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

//   InternetConnectionWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final internetConnectionStatus =
//         Provider.of<InternetConnectionStatus>(context);

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (internetConnectionStatus == InternetConnectionStatus.disconnected) {
//         scaffoldMessengerKey.currentState!.showSnackBar(
//           const SnackBar(
//             content: Center(
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   'No internet connection',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//             duration: Duration(seconds: 5),
//           ),
//         );
//       }
//     });

//     return ScaffoldMessenger(
//       key: scaffoldMessengerKey,
//       child: const Scaffold(
//         body: HomePage(),
//       ),
//     );
//   }
// }

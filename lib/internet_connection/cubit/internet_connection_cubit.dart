import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

enum InternetStatus { connected, disconnected }

class InternetConnectionCubit extends Cubit<InternetStatus> {
  final InternetConnectionChecker _internetConnectionChecker;
  InternetConnectionCubit({required internetConnectionChecker})
      : _internetConnectionChecker = internetConnectionChecker,
        super((InternetStatus.connected)) {
    _internetConnectionChecker.onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          emit(InternetStatus.connected);
          break;
        case InternetConnectionStatus.disconnected:
          emit(InternetStatus.disconnected);
          break;
      }
    });
  }
}

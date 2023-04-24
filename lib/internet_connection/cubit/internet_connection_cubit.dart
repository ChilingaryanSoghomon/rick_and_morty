import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionStatus> {
  final InternetConnectionChecker _internetConnectionChecker;
  InternetConnectionCubit({required internetConnectionChecker})
      : _internetConnectionChecker = internetConnectionChecker,
        super((InternetConnectionStatus.connected)) {
    _internetConnectionChecker.onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          emit(InternetConnectionStatus.connected);
          break;
        case InternetConnectionStatus.disconnected:
          emit(InternetConnectionStatus.disconnected);
          break;
      }
    });
  }
}

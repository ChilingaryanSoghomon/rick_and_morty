import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

enum InternetStatusState { connected, disconnected }

class InternetConnectionCubit extends Cubit<InternetStatusState> {
  final InternetConnectionChecker _internetConnectionChecker;
  InternetConnectionCubit({required internetConnectionChecker})
      : _internetConnectionChecker = internetConnectionChecker,
        super((InternetStatusState.connected)) {
    _internetConnectionChecker.onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          emit(InternetStatusState.connected);
          break;
        case InternetConnectionStatus.disconnected:
          emit(InternetStatusState.disconnected);
          break;
        case InternetConnectionStatus.slow:
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    });
  }
}


import 'package:bloc/bloc.dart';
import 'package:ric_and_morty/core/platform/network_info.dart';

enum InternetStatusState { connected, disconnected }



class InternetConnectionCubit extends Cubit<InternetStatusState> {
  final NetworkInfo _networkInfo;
  InternetConnectionCubit(
      {required networkInfo})
      : _networkInfo = networkInfo,
        super((InternetStatusState.connected)) {
    _networkInfo.networkConnectionStream.listen((status) {
      switch (status) {
        case NetworkConnectionChecker.connected:
          emit(InternetStatusState.connected);
          break;
        case NetworkConnectionChecker.disconnected:
          emit(InternetStatusState.disconnected);
          break;
      }
    });
  }
}

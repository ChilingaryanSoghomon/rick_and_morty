// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:ric_and_morty/core/platform/network_info.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final NetworkInfo networkInfo;
  InternetBloc(
    this.networkInfo,
  ) : super(InternetDisConnectState()) {
    on<InternetEvent>((event, emit) async {
      if (await networkInfo.isConnected) {
        emit(InternetConnectState());
      } else {
        emit(InternetDisConnectState());
      }
    });
  }
}

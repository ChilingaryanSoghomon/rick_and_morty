part of 'internet_bloc.dart';

abstract class InternetState extends Equatable {
  const InternetState();
  
  @override
  List<Object> get props => [];
}

class InternetDisConnectState extends InternetState {}
class InternetConnectState extends InternetState {}


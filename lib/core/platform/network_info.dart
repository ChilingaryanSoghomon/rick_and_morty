import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';

enum NetworkConnectionChecker { connected, disconnected }

class NetworkInfo {
  final InternetConnectionChecker _connectionChecker;
  late final Stream networkConnectionStream;
  NetworkInfo({required InternetConnectionChecker connectionChecker})
      : _connectionChecker = connectionChecker {
    networkConnectionStream = _connectionChecker.onStatusChange
        .transform<NetworkConnectionChecker>(StreamTransformer.fromHandlers(
      handleData: (data, sink) {
        if (data == InternetConnectionStatus.connected) {
          sink.add(NetworkConnectionChecker.connected);
        } else if (data == InternetConnectionStatus.disconnected) {
          sink.add(NetworkConnectionChecker.disconnected);
        }
      },
      handleError: (error, stackTrace, sink) {
        print(error);
      },
    ));
  }
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}

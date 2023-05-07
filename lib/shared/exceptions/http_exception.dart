import 'package:equatable/equatable.dart';

class AppException implements Exception {
  final String? message;
  final int? statusCode;

  AppException({
    required this.message,
    required this.statusCode,
  });
  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\n';
  }
}

class NoNetworkException extends Equatable implements AppException {
  @override
  String? get message => 'Unable to save user';

  @override
  int? get statusCode => 100;

  @override
  List<Object?> get props => [message, statusCode];
}

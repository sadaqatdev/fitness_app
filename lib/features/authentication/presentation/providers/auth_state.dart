import 'package:equatable/equatable.dart';

enum ScreenState { init, loading, loaded, error, dashBoard }

class AuthState extends Equatable {
  final String message;

  final ScreenState screenState;

  const AuthState({
    this.message = '',
    required this.screenState,
  });

  @override
  List<Object?> get props => [];

  AuthState copyWith({
    String? message,
    ScreenState? screenState,
  }) {
    return AuthState(
      message: message ?? this.message,
      screenState: screenState ?? this.screenState,
    );
  }
}

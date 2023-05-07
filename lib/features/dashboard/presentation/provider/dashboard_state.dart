import 'package:equatable/equatable.dart';

import 'package:fitness_app/features/authentication/presentation/providers/auth_state.dart';

class DashBoardState extends Equatable {
  final num todaySteps;
  final num weeklySteps;
  final num monthlySteps;
  final num yearlySteps;
  final ScreenState screenState;
  final String? message;

  const DashBoardState(
      {required this.todaySteps,
      required this.weeklySteps,
      required this.monthlySteps,
      required this.yearlySteps,
      required this.screenState,
      this.message});

  const DashBoardState.init(
      {this.todaySteps = 0,
      this.weeklySteps = 0,
      this.monthlySteps = 0,
      this.yearlySteps = 0,
      this.message = '',
      this.screenState = ScreenState.init});

  @override
  List<Object?> get props => [];

  DashBoardState copyWith({
    num? todaySteps,
    num? weeklySteps,
    num? monthlySteps,
    num? yearlySteps,
    ScreenState? screenState,
    String? message,
  }) {
    return DashBoardState(
      todaySteps: todaySteps ?? this.todaySteps,
      weeklySteps: weeklySteps ?? this.weeklySteps,
      monthlySteps: monthlySteps ?? this.monthlySteps,
      yearlySteps: yearlySteps ?? this.yearlySteps,
      screenState: screenState ?? this.screenState,
      message: message ?? this.message,
    );
  }
}

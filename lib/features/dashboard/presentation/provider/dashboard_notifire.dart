import 'package:fitness_app/features/authentication/presentation/providers/auth_state.dart';
import 'package:fitness_app/features/dashboard/domain/health_repo.dart';
import 'package:fitness_app/shared/utils/log_utils.dart';
import 'package:fitness_app/shared/utils/permission_utils.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dashboard_state.dart';

class DashBoardNotifier extends StateNotifier<DashBoardState> {
  DashBoardNotifier({required this.healthRepo})
      : super(const DashBoardState.init());

  final HealthRepo healthRepo;

  var types = [
    HealthDataType.STEPS,
  ];

  getPermissionForActivity() async {
    await PermissionUtils.checkActivityRecogPermission();

    if (!(await healthRepo.hasPermission(types))) {
      getHealthDataPermission();
    } else {
      getStepsCountData();
    }
  }

  getHealthDataPermission() async {
    var isGranted = await healthRepo.requestAuthorization(types);

    if (isGranted) {
      getStepsCountData();
    }
  }

  getStepsCountData() async {
    try {
      var accessWasGranted = await healthRepo.hasPermission(types);

      var activityRecognition = await Permission.activityRecognition.isGranted;

      if (accessWasGranted && activityRecognition) {
        state = state.copyWith(screenState: ScreenState.loading);

        var currentDate = DateTime.now();

        dp(
            msg: "Date yester days",
            arg: currentDate.subtract(const Duration(days: 30)));

        var todaySteps = await healthRepo.getStepsCount(
            currentDate.subtract(const Duration(days: 1)), currentDate, types);

        var weeklySteps = await healthRepo.getStepsCount(
            currentDate.subtract(const Duration(days: 7)), currentDate, types);

        var monthlySteps = await healthRepo.getStepsCount(
            currentDate.subtract(const Duration(days: 30)), currentDate, types);

        var yearlySteps = await healthRepo.getStepsCount(
            DateTime(currentDate.year, 1, 1), currentDate, types);

        state = DashBoardState(
            todaySteps: todaySteps,
            weeklySteps: weeklySteps,
            monthlySteps: monthlySteps,
            yearlySteps: yearlySteps,
            screenState: ScreenState.loaded);

        //
      } else {
        state = state.copyWith(
            screenState: ScreenState.error,
            message:
                "Please give Activity recognition and read health connect.kit data read permission");
      }
    } catch (e, s) {
      dp(msg: "Error in read steps $e ", arg: s);

      state = state.copyWith(
          screenState: ScreenState.error,
          message: "Cannot read data please try again");
    }
  }
}

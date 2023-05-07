import 'package:fitness_app/shared/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

import 'package:fitness_app/features/dashboard/domain/health_repo.dart';

import '../../../shared/widgets/snakbar.dart';

class HealthRepoImpl extends HealthRepo {
  final HealthFactory health;

  HealthRepoImpl({
    required this.health,
  });

  @override
  Future<num> getStepsCount(
      DateTime startDate, DateTime endDate, List<HealthDataType> types) async {
    //

    try {
      List<HealthDataPoint> todayData =
          await health.getHealthDataFromTypes(startDate, endDate, types);

      return todayData.fold<num>(
          0,
          (previousValue, element) =>
              previousValue +
              (num.parse(element.value.toJson()['numericValue'])));
    } catch (e, s) {
      dp(msg: "Error in geting steps $e ", arg: s);
      return 0;
    }
  }

  @override
  Future<bool> hasPermission(List<HealthDataType> types) async {
    return await health.hasPermissions(types,
            permissions: [HealthDataAccess.READ_WRITE]) ??
        false;
  }

  @override
  Future requestAuthorization(List<HealthDataType> types) async {
    showPermissionDialog(
        "Please give Health Connect/Kit data read permission to work app properly",
        (ctx) async {
      await health.requestAuthorization(types,
          permissions: [HealthDataAccess.READ_WRITE]);
      if (ctx.mounted) Navigator.pop(ctx);
    });
  }
}

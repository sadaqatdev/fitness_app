import 'package:health/health.dart';

abstract class HealthRepo {
  Future<num> getStepsCount(
      DateTime startDate, DateTime endDate, List<HealthDataType> types);

  Future<bool> hasPermission(List<HealthDataType> types);

  Future requestAuthorization(List<HealthDataType> types);
}

import 'package:fitness_app/features/dashboard/domain/health_repo_impl.dart';
import 'package:fitness_app/features/dashboard/presentation/provider/dashboard_notifire.dart';
import 'package:fitness_app/features/dashboard/presentation/provider/dashboard_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';

final healtFactoryProvider =
    Provider((ref) => HealthFactory(useHealthConnectIfAvailable: false));

final healthRepo =
    Provider((ref) => HealthRepoImpl(health: ref.watch(healtFactoryProvider)));

final dashboardStateProvider =
    StateNotifierProvider<DashBoardNotifier, DashBoardState>((ref) {
  return DashBoardNotifier(healthRepo: ref.watch(healthRepo));
});

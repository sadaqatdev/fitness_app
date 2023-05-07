import 'package:fitness_app/features/authentication/domain/repositories/auth_repositories.dart';
import 'package:fitness_app/features/authentication/presentation/providers/auth_state.dart';
import 'package:fitness_app/shared/applables/app_lables.dart';
import 'package:fitness_app/shared/local.data.service/hive_keys.dart';
import 'package:fitness_app/shared/local.data.service/hive_local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.authRepository)
      : super(const AuthState(message: '', screenState: ScreenState.init));

  final AuthRepository authRepository;

  googleSign() async {
    state = state.copyWith(
      screenState: ScreenState.loading,
    );
    try {
      var eitherResponse = await authRepository.loginWithGoogle();

      eitherResponse.fold((l) {
        state = state.copyWith(
          message: l.message,
          screenState: ScreenState.error,
        );
      }, (r) async {
        await HiveStorage.write(
            boxName: HiveKeys.currentUserBox,
            key: HiveKeys.currentUserKey,
            value: r.toJson());

        state = state.copyWith(
            message: AppLabels.signinMessage,
            screenState: ScreenState.dashBoard);
      });
    } catch (e) {
      state = state.copyWith(
          message: AppLabels.somethingWentWrong,
          screenState: ScreenState.error);
    }
  }

  appleSigning() async {
    //

    state = state.copyWith(
      screenState: ScreenState.loading,
    );
    try {
      var eitherResponse = await authRepository.loginWithApple();

      eitherResponse.fold((l) {
        state = state.copyWith(
          message: l.message,
          screenState: ScreenState.error,
        );
      }, (r) async {
        //

        await HiveStorage.write(
            boxName: HiveKeys.currentUserBox,
            key: HiveKeys.currentUserKey,
            value: r.toJson());

        state = state.copyWith(
            message: AppLabels.signinMessage,
            screenState: ScreenState.dashBoard);
      });
    } catch (e) {
      state = state.copyWith(
          message: AppLabels.somethingWentWrong,
          screenState: ScreenState.error);
    }
  }
}

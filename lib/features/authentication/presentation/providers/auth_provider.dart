import 'package:fitness_app/features/authentication/domain/di/auth_repo_provider.dart';
import 'package:fitness_app/features/authentication/presentation/providers/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_notifire.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  var authRepo = ref.watch(authRepoImpProvider);
  return AuthNotifier(authRepo);
});

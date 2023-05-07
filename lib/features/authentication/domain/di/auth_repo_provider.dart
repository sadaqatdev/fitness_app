import 'package:fitness_app/features/authentication/data/datasource/login_datasource_impl.dart';
import 'package:fitness_app/features/authentication/data/repository/auth_repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginDataSourceProvider = Provider<LoginDataSourceImpl>((ref) {
  return LoginDataSourceImpl();
});

final authRepoImpProvider = Provider<AuthRepoImpl>((ref) {
  var loginDataSource = ref.watch(loginDataSourceProvider);
  return AuthRepoImpl(loginDataSource: loginDataSource);
});

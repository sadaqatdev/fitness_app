import 'package:dartz/dartz.dart';

import 'package:fitness_app/features/authentication/data/datasource/login_datasource.dart';
import 'package:fitness_app/features/authentication/domain/models/current_user.dart';
import 'package:fitness_app/features/authentication/domain/repositories/auth_repositories.dart';
import 'package:fitness_app/shared/exceptions/http_exception.dart';

class AuthRepoImpl extends AuthRepository {
  final LoginDataSource loginDataSource;
  AuthRepoImpl({
    required this.loginDataSource,
  });

  @override
  Future<Either<AppException, CurrentUser>> loginWithApple() {
    return loginDataSource.loginWithApple();
  }

  @override
  Future<Either<AppException, CurrentUser>> loginWithGoogle() {
    return loginDataSource.loginWithGoogle();
  }
}

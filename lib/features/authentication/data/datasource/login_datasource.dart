import 'package:dartz/dartz.dart';
import 'package:fitness_app/shared/exceptions/http_exception.dart';

import '../../domain/models/current_user.dart';

abstract class LoginDataSource {
  Future<Either<AppException, CurrentUser>> loginWithApple();

  Future<Either<AppException, CurrentUser>> loginWithGoogle();
}

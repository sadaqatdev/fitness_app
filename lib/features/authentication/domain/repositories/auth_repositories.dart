import 'package:dartz/dartz.dart';
import 'package:fitness_app/features/authentication/domain/models/current_user.dart';
import 'package:fitness_app/shared/exceptions/http_exception.dart';

abstract class AuthRepository {
  Future<Either<AppException, CurrentUser>> loginWithGoogle();
  Future<Either<AppException, CurrentUser>> loginWithApple();
}

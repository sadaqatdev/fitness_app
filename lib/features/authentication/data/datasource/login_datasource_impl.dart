import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/features/authentication/data/datasource/login_datasource.dart';
import 'package:fitness_app/shared/applables/app_lables.dart';
import 'package:fitness_app/shared/exceptions/http_exception.dart';
import 'package:fitness_app/features/authentication/domain/models/current_user.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../shared/utils/apple_sign_utils.dart';

class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future<Either<AppException, CurrentUser>> loginWithApple() async {
    //

    try {
      final rawNonce = generateNonceUtils();

      final nonce = sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      if (userCredential.user != null) {
        return Right(CurrentUser(
            name: userCredential.user?.displayName ?? "",
            email: userCredential.user?.email ?? '',
            uid: userCredential.user?.uid ?? '',
            profilePicUrl: userCredential.user?.photoURL ?? ''));
      } else {
        return Left(
            AppException(message: AppLabels.emailNotFoundmsg, statusCode: 400));
      }
    } on SocketException {
      return Left(
          AppException(message: AppLabels.internetMsg, statusCode: 400));
    } on TimeoutException {
      return Left(
          AppException(message: AppLabels.slowInternetMsg, statusCode: 400));
    } catch (e, s) {
      debugPrint("$e     $s");
      return Left(
          AppException(message: AppLabels.somethingWentWrong, statusCode: 400));
    }
  }

  @override
  Future<Either<AppException, CurrentUser>> loginWithGoogle() async {
    try {
      final GoogleSignIn google = GoogleSignIn(scopes: [
        'email',
      ]);

      if (await google.isSignedIn()) {
        await google.signOut();
      }

      GoogleSignInAccount? googleSignInAccount = await google.signIn();

      // Get the Google authentication object using the Google account object
      final GoogleSignInAuthentication? googleAuth =
          await googleSignInAccount?.authentication;

      // Create a credential using the Google authentication object
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in to Firebase using the Google credential

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        return Right(CurrentUser(
            name: userCredential.user?.displayName ?? "",
            email: userCredential.user?.email ?? '',
            uid: userCredential.user?.uid ?? '',
            profilePicUrl: userCredential.user?.photoURL ?? ''));
      } else {
        return Left(
            AppException(message: AppLabels.emailNotFoundmsg, statusCode: 400));
      }
    } on SocketException {
      return Left(
          AppException(message: AppLabels.internetMsg, statusCode: 400));
    } on TimeoutException {
      return Left(
          AppException(message: AppLabels.slowInternetMsg, statusCode: 400));
    } catch (e, s) {
      debugPrint("$e     $s");

      return Left(
          AppException(message: AppLabels.somethingWentWrong, statusCode: 400));
    }
  }
}

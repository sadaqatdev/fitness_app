import 'dart:io';

import 'package:fitness_app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:fitness_app/features/authentication/presentation/providers/auth_state.dart';
import 'package:fitness_app/features/dashboard/presentation/dash_board.dart';
import 'package:fitness_app/shared/assets_utils.dart';
import 'package:fitness_app/shared/extentions/build_context_ext.dart';
import 'package:fitness_app/shared/navigation/navigation_utils.dart';
import 'package:fitness_app/shared/theme/app_colors.dart';
import 'package:fitness_app/shared/utils/sizes_utils.dart';
import 'package:fitness_app/shared/widgets/snakbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/social_login_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var authState = ref.watch(authStateProvider);

    ref.listen(authStateProvider, (previous, next) {
      if (next.screenState == ScreenState.error) {
        showSnackBar(next.message);
      }
      if (next.screenState == ScreenState.dashBoard) {
        toRemove(const DashBoardScreen());
      }
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        color: AppColors.primaryColor,
        width: context.getScreenSize().width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: context.getTextStyle().copyWith(
                    fontSize: SizesUtils.twentyFive,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: context.getScreenSize().width / 8,
              ),
              if (authState.screenState == ScreenState.loading)
                const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
              else ...[
                SocialLoginButton(
                  iconPath: AssetsUtils.googleIcon,
                  lable: "Google",
                  bgColor: AppColors.goolgeSign,
                  iconColors: Colors.blue,
                  textColor: Colors.white,
                  onTap: () {
                    //
                    ref.read(authStateProvider.notifier).googleSign();
                    //
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Platform.isIOS
                    ? SocialLoginButton(
                        iconPath: AssetsUtils.appleIcon,
                        lable: "Apple",
                        bgColor: Colors.black,
                        iconColors: Colors.white,
                        textColor: Colors.white,
                        onTap: () {
                          //
                          ref.read(authStateProvider.notifier).appleSigning();

                          //
                        },
                      )
                    : const SizedBox(),
              ],
              SizedBox(
                height: context.getScreenSize().width / 4,
              ),
            ]),
      ),
    );
  }
}

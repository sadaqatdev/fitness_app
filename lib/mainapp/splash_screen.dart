import 'package:fitness_app/features/authentication/presentation/screens/login_screen.dart';
import 'package:fitness_app/features/dashboard/presentation/dash_board.dart';
import 'package:fitness_app/shared/extentions/build_context_ext.dart';
import 'package:fitness_app/shared/navigation/navigation_utils.dart';
import 'package:fitness_app/shared/utils/sizes_utils.dart';
import 'package:flutter/material.dart';

import '../shared/local.data.service/hive_keys.dart';
import '../shared/local.data.service/hive_local_storage.dart';
import '../shared/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //

    Future.delayed(const Duration(seconds: 3)).then((value) async {
      var currentUser = await HiveStorage.readHiveValue(
        boxName: HiveKeys.currentUserBox,
        key: HiveKeys.currentUserKey,
      );
      if (currentUser == null) {
        toRemove(const LoginScreen());
      } else {
        toRemove(const DashBoardScreen());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: AppColors.primaryColor,
          height: context.getScreenSize().height,
          width: context.getScreenSize().width,
          child: Center(
            child: Text(
              "Fitness App",
              style: context
                  .getTextStyle()
                  .copyWith(fontSize: SizesUtils.twentyFive),
            ),
          )),
    );
  }
}

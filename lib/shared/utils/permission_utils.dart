import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widgets/snakbar.dart';
import 'log_utils.dart';

class PermissionUtils {
  static Future<bool> checkActivityRecogPermission() async {
    //

    try {
      var status = await Permission.activityRecognition.request();

      dp(msg: "activityRecognition service status", arg: status);

      if (status.isGranted) {
        return true;
      } else if (status.isDenied) {
        showSnackBar("Permission is denied,");
        return false;
      } else if (status.isLimited) {
        return true;
      } else if (status.isPermanentlyDenied) {
        //

        await showPermissionDialog(
            "Please give ActivityRecognition permission to work app properly",
            (c) async {
          await openAppSettings();
          if (Platform.isIOS) {
            Navigator.pop(c);
          }
        });

        var status2 = await Permission.activityRecognition.request();

        return status2.isGranted;
      } else {
        return false;
      }
    } catch (e, s) {
      dp(msg: "Error in request permission", arg: s);
      return false;
    }
  }
}

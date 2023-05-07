import 'package:fitness_app/shared/extentions/build_context_ext.dart';
import 'package:fitness_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../navigation/navigation_utils.dart';

showSnackBar(data) {
  ScaffoldMessenger.of(kNavigatorKey.currentState!.context).showSnackBar(
    SnackBar(
      content: Text(data),
      duration: const Duration(seconds: 1),
    ),
  );
}

Future showPermissionDialog(t, void Function(BuildContext c) f) async {
  await showDialog(
      context: kNavigatorKey.currentState!.context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.close),
                  )),
            ),
            Material(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      t,
                      maxLines: 3,
                      style: context
                          .getTextStyle()
                          .copyWith(fontSize: 14, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: MaterialButton(
                        height: 45,
                        onPressed: () {
                          f(context);
                        },
                        child: Text("Open Setting"),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      });
}

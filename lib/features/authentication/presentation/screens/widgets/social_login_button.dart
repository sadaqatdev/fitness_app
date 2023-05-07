import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      this.height = 50,
      this.width = 220,
      this.iconColors,
      this.textColor,
      required this.iconPath,
      required this.lable,
      required this.bgColor,
      required this.onTap});

  final String lable;
  final String iconPath;
  final double height;
  final double width;
  final Color bgColor;
  final Color? iconColors;
  final Color? textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 25,
            ),
            Image(
              image: AssetImage(iconPath),
              color: iconColors,
              height: 38,
              width: 38,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              lable,
              style: TextStyle(
                  color: textColor ?? Colors.black,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

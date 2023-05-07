import 'package:fitness_app/mainapp/splash_screen.dart';
import 'package:flutter/material.dart';
import '../shared/navigation/navigation_utils.dart';
import '../shared/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      navigatorKey: kNavigatorKey,
      home: const SplashScreen(),
    );
  }
}

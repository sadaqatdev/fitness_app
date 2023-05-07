import 'package:flutter/material.dart';

var kNavigatorKey = GlobalKey<NavigatorState>();

Future toNext(Widget widget) {
  return Navigator.push(kNavigatorKey.currentState!.context,
      MaterialPageRoute(builder: (_) => widget));
}

Future toRemove(Widget widget) {
  return Navigator.pushReplacement(kNavigatorKey.currentState!.context,
      MaterialPageRoute(builder: (_) => widget));
}

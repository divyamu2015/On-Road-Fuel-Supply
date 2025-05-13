import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMsgKey =
GlobalKey<ScaffoldMessengerState>();

///Class for navigation without using context.
class AppNavigator {
  ///Global key to implement contextless navigation.
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
  AppNavigator._();

  ///Method for contextless navigation
  static void pop<T extends Object>([T? result]) {
    navigatorKey.currentState!.pop(result);
  }

  ///Method for contextless navigation
  static Future<void> popAll() async {
    return navigatorKey.currentState!.popUntil((route) => false);
  }

  ///Method for contextless navigation
  static Future<void> popUntil<T extends Object>(String routeName) async {
    return navigatorKey.currentState!
        .popUntil((route) => route.settings.name == routeName);
  }

  ///Method for contextless navigation
  static Future<T?> push<T extends Object>(Route<T> route) {
    return navigatorKey.currentState!.push<T>(route);
  }

  ///Method for contextless navigation
  static Future pushNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  ///Method for contextless navigation
  static Future<void> pushNamedAndPopAll<T extends Object>(String routeName,
      {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => true);
  }

  ///Method for contextless navigation
  static Future<T?> pushReplacement<T extends Object, TO extends Object>(
      Route<T> newRoute,
      {TO? result}) {
    return navigatorKey.currentState!.pushReplacement(newRoute);
  }

  ///Method for contextless navigation
  static Future pushReplacementNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }
}

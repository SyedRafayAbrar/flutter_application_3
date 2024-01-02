import 'package:flutter/material.dart';

enum AppRoutes {
  home,
  forgotPW,
}

enum NavigationType {
  push,
  presentRoot,
}


class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(AppRoutes route, NavigationType type, {required Object arguments}) {
  String routeName = _enumToString(route);
  
  switch (type) {
    case NavigationType.push:
      return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
    case NavigationType.presentRoot:
      return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
    // Add more navigation types as needed
  }

  
}

static String _enumToString(Object e) => e.toString().split('.').last;

  static bool goBack() {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
      return true;
    }
    return false;
  }
}
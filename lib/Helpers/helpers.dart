import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/global.dart';

enum AppRoutes {
  home,
  login,
  signUp,
  forgotPW,
  itemDetails,
  customerDashboard,
  complaint,
  InvitationScreen,
  selectResidentialScreen,
  appartmentInfoScreen,
}

enum NavigationType {
  push,
  presentRoot,
}

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(AppRoutes route, NavigationType type,
      {required Object arguments}) {
    String routeName = _enumToString(route);

    switch (type) {
      case NavigationType.push:
        pageCount += 1;
        return navigatorKey.currentState!
            .pushNamed(routeName, arguments: arguments);
      case NavigationType.presentRoot:
        pageCount = 0;
        return navigatorKey.currentState!.pushNamedAndRemoveUntil(
            routeName, (route) => false,
            arguments: arguments);
      // Add more navigation types as needed
    }
  }

  static String _enumToString(Object e) => e.toString().split('.').last;

  static bool goBack() {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
      pageCount -= 1;
      return true;
    }
    return false;
  }
}

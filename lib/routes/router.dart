import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/screens/dash.dart';
import 'package:flutter_assignment/presentation/screens/onboarding/onboarding.dart';
import 'package:logger/logger.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static const String initial = "/";
  static const String dashboard = "/dashboard";

  static Route? onGenerateRoute(RouteSettings settings) {
    Logger logger = Logger();
    logger.w("Route Name:\n${settings.name}");

    switch (settings.name) {
      case initial:
        logger.w("Initial Route : Onboarding");
        return _route(
          Onboarding(),
        );

      case dashboard:
        logger.w("Dashboard");
        return _route(
          Dashboard(),
        );

      default:
        return null;
    }
  }

  static _route(Widget page) {
    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
    );
  }

  static _transition(Widget page) {
    return PageTransition(
      child: page,
      type: PageTransitionType.rightToLeft,
      curve: Curves.easeInOut,
      isIos: true,
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}

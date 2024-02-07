import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/screens/dash.dart';
import 'package:flutter_assignment/presentation/screens/onboarding/onboarding.dart';
import 'package:flutter_assignment/presentation/search/order_detail_page.dart';
import 'package:logger/logger.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static const String initial = "/";
  static const String dashboard = "/dashboard";
  static const String orderdetails = "/orderdetails";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    Logger logger = Logger();
    logger.w("Route Name:\n${settings.name}");

    switch (settings.name) {
      case initial:
        return MaterialPageRoute(
          builder: (context) {
            return Onboarding();
          },
        );

      case dashboard:
        logger.w("Dashboard");
        return _transition(
          Dashboard(),
        );

      case orderdetails:
        if (args is Map) {
          logger.w("Order Details");
          return _transition(
            OrderDetailPage(
                orderNumber: args['orderNumber'],
                trackingNumber: args['trackingNumber']),
          );
        }
        break;
      default:
        return null;
    }
    return null;
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
      duration: Duration(milliseconds: 300),
      type: PageTransitionType.rightToLeft,
      curve: Curves.easeInOut,
      isIos: true,
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}

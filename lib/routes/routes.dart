import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/screens/home/homescreen.dart';
import 'package:flutter_assignment/presentation/screens/onboarding/onboarding.dart';

class RoutesName {
  static const String onboarding = "home_screen";
  static const String home = "signup_screen";
  static const String sigin = "signin_screen";
}

class Routes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onboarding:
        return MaterialPageRoute(
          builder: (context) {
            return Onboarding();
          },
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(builder: ((context) {
          return const Scaffold(
            body: Center(
              child: Text("No Routes Found"),
            ),
          );
        }));
    }
  }
}

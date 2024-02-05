 
 
import 'package:flutter/cupertino.dart';
import 'package:flutter_assignment/presentation/screens/onboarding/onboarding.dart';
import 'package:logger/logger.dart';
import 'package:page_transition/page_transition.dart';

 
class AppRouter {
  static const String initial = "/";


  static Route? onGenerateRoute(RouteSettings settings) {

    Logger logger = Logger();
    logger.w("Route Name:\n${settings.name}");

    switch (settings.name) {
 
      case initial:
        return _route(
          const Onboarding(),
        );
    
//  case landingPage:
//         return _transition(
//           const LandingPageWidget(),
//         );

      default:
        return null;
    }
  }

  static _route(Widget page) {
    return CupertinoPageRoute(
      builder: (context) {
        return page;
      },
    );
  }

  static _transition(Widget page) {
    return PageTransition(
      child: page,
      type: PageTransitionType.rightToLeft,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      isIos: true,
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}

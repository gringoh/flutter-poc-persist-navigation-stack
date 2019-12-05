import 'package:flutter/material.dart';
import 'package:navigation_state_restoration/pages/error_page.dart';
import 'package:navigation_state_restoration/pages/page_one.dart';
import 'package:navigation_state_restoration/pages/page_three.dart';
import 'package:navigation_state_restoration/pages/page_two.dart';
import 'package:navigation_state_restoration/pages/splash_page.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case SplashPage.name:
        return MaterialPageRoute(
            builder: (_) => SplashPage(),
            settings: RouteSettings(name: SplashPage.name),
        );
      case PageOne.name:
//        if (args != null && args is String) {
          return MaterialPageRoute(
            builder: (_) => PageOne(data: args),
            settings: RouteSettings(name: PageOne.name),
          );
//        }
//        // if params is not of desired type, send to error page
//        return _errorRoute();
      case PageTwo.name:
        return MaterialPageRoute(
          builder: (_) => PageTwo(),
          settings: RouteSettings(name: PageTwo.name),
        );
      case PageThree.name:
        return MaterialPageRoute(
          builder: (_) => PageThree(),
          settings: RouteSettings(name: PageThree.name),
        );
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => ErrorPage(),
      settings: RouteSettings(name: ErrorPage.name),
    );
  }

}
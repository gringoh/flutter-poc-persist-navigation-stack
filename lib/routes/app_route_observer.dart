import 'package:flutter/material.dart';
import 'package:navigation_state_restoration/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRouteObserver extends RouteObserver {
  List<String> routes = [];

  void saveHistory() async {
    var history = StringBuffer();
    routes.forEach((item) => history.write(item));

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('history', history.toString());

    debugPrint(history.toString());
  }

  @override
  void didPop(Route route, Route previousRoute) {
    debugPrint('pop: ${route.settings.name}');
    if (routes.length > 0) {
      routes.removeLast();
    }
    saveHistory();
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route previousRoute) {
    debugPrint('push: ${route.settings.name}');
    if (route.settings.name != SplashPage.name) {
      routes.add(route.settings.name);
      saveHistory();
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    routes.removeLast();
    saveHistory();
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    debugPrint('replace: ${oldRoute.settings.name} with ${newRoute.settings.name}');
    if (routes.length > 0) {
      routes.removeLast();
    }
    routes.add(newRoute.settings.name);
    saveHistory();
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

}
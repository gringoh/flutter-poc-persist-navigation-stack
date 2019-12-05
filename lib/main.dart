import 'package:flutter/material.dart';
import 'package:navigation_state_restoration/routes/app_route_observer.dart';
import 'package:navigation_state_restoration/routes/route_generator.dart';
import 'package:navigation_state_restoration/pages/splash_page.dart';

void main() => runApp(
  MaterialApp(
    title: 'NavigationStateRestoration',
    navigatorObservers: [ AppRouteObserver() ],
    initialRoute: SplashPage.name,
    onGenerateRoute: RouteGenerator.generateRoute,
  )
);
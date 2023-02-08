import 'package:flutter/material.dart';
import 'general/ui/screens/splash.dart';

Route<dynamic> getRoutes(RouteSettings settings) {
  switch (settings.name) {
    case 'splash':
      return getPageRoute(const Splash());
    default:
      return getPageRoute(const Splash());
  }
}

dynamic getPageRoute(Widget route) {
  return MaterialPageRoute(
    builder: (BuildContext context) {
      return route;
    },
  );
}

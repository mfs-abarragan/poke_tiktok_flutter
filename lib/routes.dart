import 'package:flutter/material.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/ui/screens/pokemon-slider.dart';
import 'general/ui/screens/splash.dart';

Route<dynamic> getRoutes(RouteSettings settings) {
  switch (settings.name) {
    case 'splash':
      return getPageRoute(const Splash());
    case 'pokemon-slider':
      return getPageRoute(const PokemonSlider());
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

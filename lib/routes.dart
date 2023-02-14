import 'package:flutter/material.dart';
import 'package:poke_tiktok_flutter/favourites/ui/screens/favourites_list.dart';
import 'general/ui/screens/splash.dart';
import 'pokemon-slider/ui/screens/pokemon_slider.dart';

Route<dynamic> getRoutes(RouteSettings settings) {
  switch (settings.name) {
    case 'splash':
      return getPageRoute(const Splash());
    case 'pokemon-slider':
      return getPageRoute(PokemonSlider());
    case 'favourites-list':
      return getPageRoute(const FavouritesList());
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

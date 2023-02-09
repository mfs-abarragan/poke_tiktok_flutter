import 'package:flutter/material.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/ui/widgets/pokemon_slider_item.dart';

class PokemonSlider extends StatelessWidget {
  const PokemonSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: PokemonSliderItem(),
      ),
    );
  }
}

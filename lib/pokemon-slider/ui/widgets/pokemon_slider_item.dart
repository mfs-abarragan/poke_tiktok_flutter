import 'package:flutter/material.dart';

import 'pokemon_slider_appbar.dart';

class PokemonSliderItem extends StatelessWidget {
  const PokemonSliderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PokemonSliderAppBar(),
        body: Container(),
      ),
    );
  }
}

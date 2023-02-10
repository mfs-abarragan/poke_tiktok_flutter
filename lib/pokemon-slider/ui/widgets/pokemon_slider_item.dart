import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/general/controllers/general_controller.dart';
import 'package:poke_tiktok_flutter/general/ui/styles/general_styles.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/controllers/pokemon_slider_controller.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/controllers/pokemon_types.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/ui/widgets/pokemon_slider_item_sprite.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/ui/widgets/pokemon_slider_item_stats_panel.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/ui/widgets/pokemon_slider_item_top_panel.dart';

import '../../controllers/pokemon.dart';

class PokemonSliderItem extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonSliderItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeneralController generalController = Get.put(GeneralController());
    PokemonSliderController pokemonSliderController =
        Get.put(PokemonSliderController());

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: PokemonTypes.types[pokemon.types[0]]['color'],
          padding: const EdgeInsets.only(left: 34, right: 34),
          child: Container(
            child: Column(
              children: [
                const PokemonSliderItemTopPanel(),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pokemon #${pokemon.number}',
                    style: const GeneralTextStyle(
                        fontFamily: 'Lato', color: Colors.white, fontSize: 16),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    generalController.capitalize(pokemon.name),
                    style: const GeneralTextStyle(
                        fontFamily: 'Lato',
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 28),
                  ),
                ),
                SizedBox(
                  height: 556,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: PokemonSliderItemStatsPanel(
                            attack: pokemon.attack,
                            defense: pokemon.defense,
                            hp: pokemon.hp,
                            types: pokemon.types),
                      ),
                      PokemonSliderItemSprite(spriteUrl: pokemon.mainSpriteUrl),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

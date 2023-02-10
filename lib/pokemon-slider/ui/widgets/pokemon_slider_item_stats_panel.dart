import 'package:flutter/material.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/controllers/pokemon_types.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/ui/widgets/pokemon_stat_container.dart';

import 'pokemon_slider_item_button.dart';
import 'pokemon_slider_item_type_container.dart';

class PokemonSliderItemStatsPanel extends StatelessWidget {
  final String attack;
  final String defense;
  final String hp;
  final List<String> types;
  const PokemonSliderItemStatsPanel(
      {Key? key,
      required this.attack,
      required this.defense,
      required this.hp,
      required this.types})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 26, right: 26, top: 60, bottom: 26),
      height: 278,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 6),
                child: PokemonStatContainer(
                  statName: 'Attack',
                  statPoints: attack,
                  typeColor: PokemonTypes.types[types[0]]['color'],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 6),
                child: PokemonStatContainer(
                  statName: 'Defense',
                  statPoints: defense,
                  typeColor: PokemonTypes.types[types[0]]['color'],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 6),
                child: PokemonStatContainer(
                  statName: 'HP',
                  statPoints: hp,
                  typeColor: PokemonTypes.types[types[0]]['color'],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 6),
                child: PokemonSliderItemTypeContainer(types: types),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 18),
            child: const PokemonSliderItemButton(),
          ),
        ],
      ),
    );
  }
}

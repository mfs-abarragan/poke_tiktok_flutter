import 'package:flutter/material.dart';

import '../../../general/ui/styles/custom_colors.dart';
import '../../../general/ui/styles/general_styles.dart';

class BattlePokemonInfoContainer extends StatelessWidget {
  final String pokemonName;

  const BattlePokemonInfoContainer({Key? key, required this.pokemonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CustomColors.battlePokemonInfoContainerColor,
        border: Border.all(width: 2, color: Colors.black),
        //borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pokemonName.toUpperCase(),
              style: const GeneralTextStyle(
                  fontFamily: 'Pokemon-Classic',
                  fontSize: 10,
                  fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('HP',
                  style: GeneralTextStyle(
                      fontFamily: 'Pokemon-Classic',
                      fontSize: 10,
                      fontWeight: FontWeight.bold)),
              Expanded(
                child: Container(
                  height: 8,
                  color: CustomColors.battlePokemonInfoContainerHpColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

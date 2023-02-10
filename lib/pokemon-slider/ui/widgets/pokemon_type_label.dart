import 'package:flutter/material.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/controllers/pokemon_types.dart';

import '../../../general/ui/styles/general_styles.dart';

class PokemonTypeLabel extends StatelessWidget {
  final String type;
  const PokemonTypeLabel({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(top: 2, bottom: 2),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: PokemonTypes.types[type]['color'],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        PokemonTypes.types[type]['text'],
        style: const GeneralTextStyle(
            fontFamily: 'Lato',
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w900),
        textAlign: TextAlign.center,
      ),
    );
  }
}

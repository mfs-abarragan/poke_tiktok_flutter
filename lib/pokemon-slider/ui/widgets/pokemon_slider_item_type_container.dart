import 'package:flutter/material.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/ui/widgets/pokemon_type_label.dart';

class PokemonSliderItemTypeContainer extends StatelessWidget {
  final List<String> types;
  const PokemonSliderItemTypeContainer({Key? key, required this.types})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PokemonTypeLabel(type: types[0]),
          Builder(builder: (BuildContext context) {
            Widget secondaryType = Container();
            if (types.length > 1) {
              secondaryType = PokemonTypeLabel(type: types[1]);
            }
            return secondaryType;
          }),
        ],
      ),
    );
  }
}

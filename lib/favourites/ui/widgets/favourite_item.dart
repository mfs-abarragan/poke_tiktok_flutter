// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/favourites/ui/widgets/remove_fav_button.dart';
import 'package:poke_tiktok_flutter/general/controllers/general_controller.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/controllers/pokemon_types.dart';

import '../../../general/ui/styles/general_styles.dart';
import '../../../pokemon-slider/controllers/pokemon.dart';

class FavouriteItem extends StatelessWidget {
  Pokemon pokemon;
  FavouriteItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeneralController generalController = Get.put(GeneralController());

    return Container(
      margin: const EdgeInsets.only(left: 42, right: 42, top: 6, bottom: 6),
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 32),
      height: 84,
      decoration: BoxDecoration(
        color: PokemonTypes.types[pokemon.types[0]]['color'],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
              imageUrl: pokemon.mainSpriteUrl,
              placeholder: (ontext, url) => const Text(''),
              errorWidget: (context, url, error) => Container()),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 14, right: 8),
              child: Text(
                generalController.capitalize(pokemon.name),
                style: const GeneralTextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ),
          RemoveFavButton(pokemonNumber: pokemon.number),
        ],
      ),
    );
  }
}

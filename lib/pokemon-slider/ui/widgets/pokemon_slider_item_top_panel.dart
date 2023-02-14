// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/favourites/controllers/favourites_controller.dart';
import 'package:poke_tiktok_flutter/favourites/controllers/favourites_pokemon_slider_controller_interface.dart';
import 'package:poke_tiktok_flutter/favourites/ui/widgets/fav_button.dart';
import 'package:poke_tiktok_flutter/favourites/ui/widgets/show_favourites_button.dart';
import 'package:poke_tiktok_flutter/favourites/ui/widgets/unfav_button.dart';

class PokemonSliderItemTopPanel extends StatelessWidget
    implements PreferredSizeWidget {
  String pokemonNumber;
  PokemonSliderItemTopPanel({Key? key, required this.pokemonNumber})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    FavouritesPokemonSliderControllerInterface controllerInterface =
        Get.put(FavouritesPokemonSliderControllerInterface());
    return Obx(
      () => Container(
        color: Colors.transparent,
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const ShowFavouritesButton(),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: controllerInterface.favourites
                      .contains(int.tryParse(pokemonNumber))
                  ? const UnfavButton()
                  : const FavButton(),
            ),
          ],
        ),
      ),
    );
  }
}

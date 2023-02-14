// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/favourites/controllers/favourites_controller.dart';

class RemoveFavButton extends StatelessWidget {
  String pokemonNumber;
  RemoveFavButton({Key? key, required this.pokemonNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouritesController favouritesController = Get.put(FavouritesController());

    return InkWell(
      onTap: () => favouritesController
          .unfavFromFavouritesList(int.tryParse(pokemonNumber) ?? 0),
      child: const Icon(Icons.delete_outline, color: Colors.white, size: 28),
    );
  }
}

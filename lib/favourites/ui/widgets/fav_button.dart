import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/favourites/controllers/favourites_controller.dart';

class FavButton extends StatelessWidget {
  const FavButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouritesController favouritesController = Get.put(FavouritesController());
    return InkWell(
      child: const Center(
        child: Icon(Icons.favorite_outline, color: Colors.white, size: 28),
      ),
      onTap: () async => await favouritesController.fav(),
    );
  }
}

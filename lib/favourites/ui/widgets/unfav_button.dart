import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/favourites_controller.dart';

class UnfavButton extends StatelessWidget {
  const UnfavButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouritesController favouritesController = Get.put(FavouritesController());

    return InkWell(
      child: const Center(
        child: Icon(Icons.favorite, color: Colors.white, size: 28),
      ),
      onTap: () => favouritesController.unfav(),
    );
  }
}

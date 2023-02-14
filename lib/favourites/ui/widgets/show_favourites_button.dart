import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/app_constants.dart';

import '../../../general/ui/styles/general_styles.dart';
import '../../controllers/favourites_controller.dart';

class ShowFavouritesButton extends StatelessWidget {
  const ShowFavouritesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouritesController favouritesController = Get.put(FavouritesController());

    return InkWell(
      child: const Text(
        AppConstants.showFavouritesText,
        style: GeneralTextStyle(
            fontFamily: 'Lato', color: Colors.white, fontSize: 16),
      ),
      onTap: () async {
        Get.toNamed('favourites-list');
        await favouritesController.readFavourites();
        await favouritesController.writeFavourites();
        await favouritesController.loadFavourites();
      },
    );
  }
}

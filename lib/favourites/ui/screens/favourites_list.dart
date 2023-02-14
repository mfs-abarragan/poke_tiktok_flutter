import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/app_constants.dart';
import 'package:poke_tiktok_flutter/favourites/controllers/favourites_pokemon_slider_controller_interface.dart';
import 'package:poke_tiktok_flutter/favourites/ui/widgets/favourite_item.dart';
import 'package:poke_tiktok_flutter/general/ui/styles/custom_colors.dart';

import '../../../general/ui/styles/general_styles.dart';

class FavouritesList extends StatelessWidget {
  const FavouritesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouritesPokemonSliderControllerInterface controllerInterface =
        Get.put(FavouritesPokemonSliderControllerInterface());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Mis favoritos',
              style: GeneralTextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w900,
                  color: CustomColors.mainButtonColor),
              textAlign: TextAlign.right,
            ),
          ),
          actions: [Container()],
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            child: const Icon(Icons.arrow_back_rounded,
                color: CustomColors.mainButtonColor),
            onTap: () => Get.back(),
          ),
        ),
        body: Obx(
          () => Container(
            color: Colors.white,
            child: controllerInterface.favouritesInfo.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.only(top: 6, bottom: 200),
                    itemCount: controllerInterface.favouritesInfo.isNotEmpty
                        ? controllerInterface.favouritesInfo.value.length
                        : 1,
                    itemBuilder: ((context, index) {
                      Widget children = Container();
                      if (controllerInterface.favouritesInfo.isNotEmpty) {
                        children = FavouriteItem(
                            pokemon: controllerInterface.favouritesInfo[index]);
                      } else {
                        children = Container();
                      }
                      return children;
                    }),
                  )
                : Container(
                    margin: const EdgeInsets.all(18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/animation_magikarp_1_cropped.gif'),
                            const Text(
                              AppConstants.noFavouritesText,
                              style: GeneralTextStyle(
                                  fontFamily: 'Lato',
                                  color: CustomColors.mainButtonColor,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

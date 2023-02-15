// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/battle/controllers/battle_controller.dart';
import 'package:poke_tiktok_flutter/battle/ui/widgets/battle-text-container.dart';
import 'package:poke_tiktok_flutter/favourites/controllers/favourites_pokemon_slider_controller_interface.dart';
import 'package:poke_tiktok_flutter/general/controllers/general_controller.dart';

import '../../../general/ui/styles/custom_colors.dart';
import '../widgets/battle-pokemon-info-container.dart';

class Battle extends StatelessWidget {
  const Battle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeneralController generalController = Get.put(GeneralController());
    FavouritesPokemonSliderControllerInterface controllerInterface =
        Get.put(FavouritesPokemonSliderControllerInterface());
    BattleController battleController = Get.put(BattleController());
    battleController.actionSequenceZero();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [Container()],
          elevation: 0,
          leading: InkWell(
            child: const Icon(Icons.arrow_back_rounded,
                color: CustomColors.mainButtonColor),
            onTap: () {
              generalController.assetsAudioPlayer.stop();
              Get.back();
            },
          ),
        ),
        body: Obx(
          () => Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible:
                            battleController.isSquirtlePlaceholderVisible.value,
                        child: const BattlePokemonInfoContainer(
                          pokemonName: 'SQUIRTLE',
                        ),
                      ),
                      Stack(
                        children: [
                          Visibility(
                            visible: battleController
                                .isSquirtlePlaceholderVisible.value,
                            child: Container(
                              height: 150,
                              padding: const EdgeInsets.all(18),
                              child: Image.asset('assets/images/squirtle.png'),
                            ),
                          ),
                          Visibility(
                            visible: battleController.isSquirtleVisible.value,
                            child: Container(
                              height: 150,
                              padding: const EdgeInsets.all(18),
                              child: Image.asset('assets/images/squirtle.png'),
                            ),
                          ),
                          Visibility(
                            visible:
                                battleController.isSquirtleWithGlasses.value,
                            child: Container(
                              height: 150,
                              padding: const EdgeInsets.all(18),
                              child: Image.asset(
                                  'assets/images/squirtle_sunglasses.png'),
                            ),
                          ),
                          Visibility(
                            visible: battleController.isMagikarpVisible.value,
                            child: Container(
                              height: 300,
                              padding: const EdgeInsets.all(18),
                              child: Image.asset(
                                  'assets/images/animation_magikarp_1.gif'),
                            ),
                          ),
                          Visibility(
                            visible: battleController.isGyaradosVisible.value,
                            child: Container(
                              height: 300,
                              padding: const EdgeInsets.all(18),
                              child: Image(image: battleController.image),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CachedNetworkImage(
                          imageUrl: controllerInterface
                              .pokemonList[
                                  controllerInterface.carouselIndex.value]
                              .secondarySpriteUrl),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: BattlePokemonInfoContainer(
                      pokemonName: controllerInterface
                          .pokemonList[controllerInterface.carouselIndex.value]
                          .name,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 18),
                    child: const BattleTextContainer(),
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

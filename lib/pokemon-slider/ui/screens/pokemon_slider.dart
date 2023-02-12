// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/general/controllers/connection_error_snackbar_controller.dart';
import 'package:poke_tiktok_flutter/general/ui/styles/general_styles.dart';
import 'package:poke_tiktok_flutter/general/ui/widgets/connection_error_snackbar.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/controllers/pokemon_slider_controller.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/ui/widgets/pokemon_slider_item.dart';
import '../../../general/controllers/general_controller.dart';

class PokemonSlider extends StatelessWidget {
  PokemonSlider({Key? key}) : super(key: key);
  GeneralController generalController = Get.put(GeneralController());
  PokemonSliderController controller = Get.put(PokemonSliderController());
  ConnectionErrorSnackbarController connectionErrorSnackbarController =
      Get.put(ConnectionErrorSnackbarController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              Positioned.fill(
                child: CarouselSlider.builder(
                  carouselController: controller.carouselController,
                  itemCount: controller.pokemonList.value.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      PokemonSliderItem(
                          pokemon: controller.pokemonList[itemIndex]),
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enlargeFactor: 0,
                    onPageChanged: (index, reason) async {
                      controller.setCarouselIndex(index);
                      if (index != (controller.pokemonList.length - 1)) {
                        generalController.setIsConnectionSnackbarVisible(false);
                      }
                      if (controller.carouselIndex.value ==
                          (controller.pokemonList.length - 1)) {
                        controller.setIsGestureDetectorVisible(true);
                      }
                    },
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
              Visibility(
                visible: controller.isGestureDetectorVisible.value,
                child: GestureDetector(
                  child: Container(
                    color: Colors.transparent,
                  ),
                  onPanUpdate: (details) async {
                    await connectionErrorSnackbarController
                        .gestureBehaviour(details);
                  },
                ),
              ),
              Visibility(
                visible: controller.isLoadingPokemon.value,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 32,
                    margin: const EdgeInsets.only(bottom: 18),
                    child: const Text(
                      'Loading more pokemon...',
                      style: GeneralTextStyle(
                          color: Colors.white, fontFamily: 'Lato'),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                alignment: Alignment.bottomCenter,
                child: ConnectionErrorSnackbar(
                  isVisible: controller
                      .generalController.isConnectionErrorSnackbarVisible.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

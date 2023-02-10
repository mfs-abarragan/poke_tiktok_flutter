// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/controllers/pokemon_slider_controller.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/ui/widgets/pokemon_slider_item.dart';

class PokemonSlider extends StatelessWidget {
  PokemonSlider({Key? key}) : super(key: key);
  PokemonSliderController controller = Get.put(PokemonSliderController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Container(
          child: Stack(
            children: [
              Positioned.fill(
                child: CarouselSlider.builder(
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
                      if (index == controller.lastLoadedPokemon.value - 1) {
                        await Future.delayed(const Duration(milliseconds: 650));
                        await controller.loadPokemon();
                        await controller.loadPokemon();
                        await controller.loadPokemon();
                        await controller.loadPokemon();
                        await controller.loadPokemon();
                      }
                    },
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

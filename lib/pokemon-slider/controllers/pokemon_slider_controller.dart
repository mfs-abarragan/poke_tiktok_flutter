import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/favourites/controllers/favourites_controller.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/controllers/pokemon.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/repository/pokemon_slider_repository.dart';
import '../../favourites/controllers/favourites_pokemon_slider_controller_interface.dart';
import '../../general/controllers/general_controller.dart';
import '../ui/screens/pokemon_slider.dart';

class PokemonSliderController extends GetxController {
  GeneralController generalController = Get.put(GeneralController());
  PokemonSliderRepository pokemonSliderRepository = PokemonSliderRepository();
  CarouselController carouselController = CarouselController();
  FavouritesController favouritesController = Get.put(FavouritesController());
  FavouritesPokemonSliderControllerInterface controllerInterface =
      Get.put(FavouritesPokemonSliderControllerInterface());

  final isLoadingPokemon = false.obs;
  final lastLoadedPokemon = 0.obs;
  final carouselIndex = 0.obs;
  final isGestureDetectorVisible = false.obs;
  final itemButtonOpacity = 1.0.obs;

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
    await loadNextFivePokemon();
    await favouritesController.readFavourites();
    print(controllerInterface.favourites);
    if (controllerInterface.pokemonList.isNotEmpty) {
      generalController.setIsSplashContentVisible(false);
      await Future.delayed(const Duration(milliseconds: 500));
      FullScreen.exitFullScreen();
      Get.to(
        () => PokemonSlider(),
        duration: const Duration(milliseconds: 1500),
        transition: Transition.circularReveal,
        curve: Curves.easeInExpo,
      );
    } else {
      FullScreen.exitFullScreen();
    }
  }

  void tapButtonEffect() async {
    itemButtonOpacity.value = 0.6;
    await Future.delayed(const Duration(milliseconds: 150));
    itemButtonOpacity.value = 1.0;
  }

  void setLastLoadedPokemon(newValue) => lastLoadedPokemon.value = newValue;

  void setIsLoadingPokemon(newValue) => isLoadingPokemon.value = newValue;

  void setCarouselIndex(newValue) => carouselIndex.value = newValue;

  void setIsGestureDetectorVisible(newValue) =>
      isGestureDetectorVisible.value = newValue;

  Future<void> loadPokemon() async {
    Pokemon pokemon;
    var response =
        await pokemonSliderRepository.loadPokemon(lastLoadedPokemon.value);
    if (response.isRight) {
      pokemon = response.right;
      controllerInterface.pokemonList.add(pokemon);
      lastLoadedPokemon.value++;
    }
  }

  Future<void> loadNextFivePokemon() async {
    for (var i = 0; i < 5; i++) {
      await loadPokemon();
    }
  }
}

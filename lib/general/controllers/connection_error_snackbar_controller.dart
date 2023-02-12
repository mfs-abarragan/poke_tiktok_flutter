import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/general/controllers/general_controller.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/controllers/pokemon_slider_controller.dart';
import '../../pokemon-slider/ui/screens/pokemon_slider.dart';

class ConnectionErrorSnackbarController extends GetxController {
  GeneralController generalController = Get.put(GeneralController());
  PokemonSliderController pokemonSliderController =
      Get.put(PokemonSliderController());

  final isRetryButtonLoading = false.obs;

  void setIsRetryButtonLoading(newValue) =>
      isRetryButtonLoading.value = newValue;

  Future<void> retryLoadingPokemonFromSplash() async {
    setIsRetryButtonLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    await pokemonSliderController.loadNextFivePokemon();
    if (pokemonSliderController.pokemonList.isNotEmpty) {
      generalController.setIsConnectionSnackbarVisible(false);
      generalController.setIsSplashContentVisible(false);
      Get.to(
        () => PokemonSlider(),
        duration: const Duration(milliseconds: 1500),
        transition: Transition.circularReveal,
        curve: Curves.easeInExpo,
      );
    }
    setIsRetryButtonLoading(false);
  }

  Future<void> retryLoadingPokemonFromSliderSnackBar() async {
    var pokemonListLengthBeforeRetrying =
        pokemonSliderController.pokemonList.length;
    setIsRetryButtonLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    await pokemonSliderController.loadNextFivePokemon();
    if (pokemonSliderController.pokemonList.length >
        pokemonListLengthBeforeRetrying) {
      generalController.setIsConnectionSnackbarVisible(false);
      pokemonSliderController.carouselController.animateToPage(
          pokemonSliderController.carouselIndex.value + 1,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeOutQuad);
    }
    pokemonSliderController.isGestureDetectorVisible(false);
    setIsRetryButtonLoading(false);
  }

  Future<void> retryLoadingPokemonFromSlider() async {
    var pokemonListLengthBeforeRetrying =
        pokemonSliderController.pokemonList.length;
    setIsRetryButtonLoading(true);
    await pokemonSliderController.loadNextFivePokemon();
    if (pokemonSliderController.pokemonList.length >
        pokemonListLengthBeforeRetrying) {
      generalController.setIsConnectionSnackbarVisible(false);
      if (pokemonSliderController.carouselIndex.value ==
          pokemonSliderController.lastLoadedPokemon.value - 6) {
        pokemonSliderController.carouselController.animateToPage(
            pokemonSliderController.carouselIndex.value + 1,
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeOutQuad);
      }
    }
    pokemonSliderController.isGestureDetectorVisible(false);
    setIsRetryButtonLoading(false);
  }

  Future<void> gestureBehaviour(details) async {
    print(pokemonSliderController.isLoadingPokemon.value);
    if (!pokemonSliderController.isLoadingPokemon.value) {
      pokemonSliderController.setIsLoadingPokemon(true);
      print('seasmamon');
      if (details.delta.dy < 0) {
        pokemonSliderController.setIsGestureDetectorVisible(false);
        bool checkConnection = await generalController.checkConnection();
        print('seasmamon2222');
        if (checkConnection) {
          print('seasmamon33333');
          await retryLoadingPokemonFromSlider();
          pokemonSliderController.setIsLoadingPokemon(false);
        } else {
          generalController.setIsConnectionSnackbarVisible(true);
          pokemonSliderController.setIsLoadingPokemon(false);
        }
      } else {
        pokemonSliderController.setIsLoadingPokemon(false);
      }
    }
  }
}

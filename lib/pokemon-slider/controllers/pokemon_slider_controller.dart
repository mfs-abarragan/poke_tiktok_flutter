import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/controllers/pokemon.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/repository/pokemon_slider_repository.dart';
import '../../general/controllers/general_controller.dart';
import '../ui/screens/pokemon_slider.dart';

class PokemonSliderController extends GetxController {
  GeneralController generalController = Get.put(GeneralController());
  PokemonSliderRepository pokemonSliderRepository =
      Get.put(PokemonSliderRepository());

  final pokemonList = [].obs;
  final lastLoadedPokemon = 0.obs;

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    await loadPokemon();
    await loadPokemon();
    await loadPokemon();
    await loadPokemon();
    await loadPokemon();
    Get.to(
      () => PokemonSlider(),
      duration: const Duration(milliseconds: 1500),
      transition: Transition.circularReveal,
      curve: Curves.easeInExpo,
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  void setLastLoadedPokemon(newValue) => lastLoadedPokemon.value = newValue;

  Future<void> loadPokemon() async {
    Pokemon pokemon;
    var response =
        await pokemonSliderRepository.loadPokemon(lastLoadedPokemon.value);
    if (response.isRight) {
      pokemon = response.right;
      pokemonList.add(pokemon);
      lastLoadedPokemon.value++;
    }
  }
}

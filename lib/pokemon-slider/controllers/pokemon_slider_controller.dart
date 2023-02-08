import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/repository/pokemon_slider_repository.dart';

class PokemonSliderController extends GetxController {
  PokemonSliderRepository pokemonSliderRepository =
      Get.put(PokemonSliderRepository());

  final pokemonList = [].obs;

  Future<void> getPokemons() async {
    var response = await pokemonSliderRepository.getPokemons();
    //pokemonList.value = response;
  }
}

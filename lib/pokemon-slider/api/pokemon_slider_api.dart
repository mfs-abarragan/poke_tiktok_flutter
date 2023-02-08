// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/app_constants.dart';
import 'package:poke_tiktok_flutter/general/controllers/general_controller.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/repository/pokemon_slider_repository.dart';

import '../controllers/pokemon.dart';
import '../controllers/server_error.dart';

class PokemonSliderAPI extends GetxController {
  GeneralController generalController = Get.put(GeneralController());

  Future<Either<List<Pokemon>, ServerError>> getPokemons() async {
    List<Pokemon> pokemonList = [];
    try {
      for (var i = 1; i <= 5; i++) {
        var response =
            await generalController.dioService.get('${AppConstants.apiUrl}/$i');
        print(json.decode(json.encode(response.data))['forms']);
      }
      return Left(pokemonList);
    } catch (e) {
      print('errorcisho: ${e.toString()}');
      return Right(
        ServerError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poke_tiktok_flutter/favourites/controllers/favourites_pokemon_slider_controller_interface.dart';
import '../../pokemon-slider/controllers/pokemon.dart';
import '../repository/favourites_repository.dart';

class FavouritesController extends GetxController {
  FavouritesPokemonSliderControllerInterface controllerInterface =
      Get.put(FavouritesPokemonSliderControllerInterface());
  FavouritesRepository favouritesRepository = FavouritesRepository();
  List favouritesToLoad = [];

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    await readFavourites();
    await loadFavourites();
  }

  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/favourites.json');
  }

  Future<File> writeFavourites() async {
    final file = await localFile;
    return file.writeAsString(controllerInterface.favourites.toString());
  }

  Future<void> readFavourites() async {
    try {
      final file = await localFile;
      final readItems = await file.readAsString();
      final convertedItems = json.decode(readItems);
      controllerInterface.favourites.value = convertedItems;
    } catch (e) {
      print('File Read Error: favourites.json: $e');
    }
  }

  Future<void> fav() async {
    await readFavourites();
    if (!controllerInterface.favourites
        .contains(controllerInterface.carouselIndex.value + 1)) {
      controllerInterface.favourites
          .add((controllerInterface.carouselIndex.value + 1).toString());
    }
    await writeFavourites();
    await readFavourites();
    await loadFavourites();
  }

  Future<void> unfav() async {
    await readFavourites();
    controllerInterface.favourites.removeWhere(
        (element) => element == (controllerInterface.carouselIndex.value + 1));
    controllerInterface.favouritesInfo.removeWhere((element) =>
        element.number ==
        (controllerInterface.carouselIndex.value + 1).toString());
    await writeFavourites();
    await readFavourites();
    await loadFavourites();
  }

  Future<void> unfavFromFavouritesList(int pokemonNumberToUnfav) async {
    await readFavourites();
    controllerInterface.favourites
        .removeWhere((element) => element == (pokemonNumberToUnfav));
    controllerInterface.favouritesInfo.removeWhere(
        (element) => element.number == (pokemonNumberToUnfav).toString());
    await writeFavourites();
    await readFavourites();
    await loadFavourites();
  }

  Future<void> loadFavouritePokemon(int favouritePokemonNumber) async {
    Pokemon pokemon;
    var response =
        await favouritesRepository.loadFavouritePokemon(favouritePokemonNumber);
    if (response.isRight) {
      pokemon = response.right;
      controllerInterface.favouritesInfo.add(pokemon);
    }
  }

  Future<void> loadFavourites() async {
    favouritesToLoad.addAll(controllerInterface.favourites);
    for (var i = 0; i < controllerInterface.favouritesInfo.length; i++) {
      favouritesToLoad.removeWhere((element) =>
          element.toString() == controllerInterface.favouritesInfo[i].number);
    }
    for (var i = 0; i < controllerInterface.pokemonList.length; i++) {
      favouritesToLoad.removeWhere(
        (element) {
          if (element.toString() == controllerInterface.pokemonList[i].number) {
            controllerInterface.favouritesInfo
                .add(controllerInterface.pokemonList[i]);
            return true;
          } else {
            return false;
          }
        },
      );
    }
    print('Favourites-mmm: ' + controllerInterface.favourites.toString());
    if (favouritesToLoad.isNotEmpty) {
      for (var i = 0; i < favouritesToLoad.length; i++) {
        await loadFavouritePokemon(favouritesToLoad[i]);
      }
    }
  }
}

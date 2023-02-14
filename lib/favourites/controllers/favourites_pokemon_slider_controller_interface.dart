import 'package:get/get.dart';

class FavouritesPokemonSliderControllerInterface extends GetxController {
  final pokemonList = [].obs;

  final favourites = [].obs;

  final favouritesInfo = [].obs;

  final carouselIndex = 0.obs;

  void setCarouselIndex(newValue) => carouselIndex.value = newValue;
}

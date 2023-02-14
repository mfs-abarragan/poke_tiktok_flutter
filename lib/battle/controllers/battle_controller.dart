import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/controllers/pokemon_slider_controller.dart';

class BattleController extends GetxController {
  PokemonSliderController pokemonSliderController =
      Get.put(PokemonSliderController());

  final isSquirtleVisible = true.obs;
  final isSquirtleWithGlasses = false.obs;
  final isMagikarpVisible = false.obs;
  final isGyaradosVisible = false.obs;

  final isActionSequenceOneVisible = true.obs;
  final isActionSequenceTwoVisible = false.obs;
  final currentBattleText =
      'Un Squirtle salvaje ha aparecido con ganas de fiesta...'.obs;

  void setVisible(whichOne) {
    switch (whichOne) {
      case 'squirtle':
        isSquirtleWithGlasses.value = false;
        isMagikarpVisible.value = false;
        isGyaradosVisible.value = false;
        isSquirtleVisible.value = true;
        break;
      case 'squirtle-sunglasses':
        isSquirtleVisible.value = false;
        isMagikarpVisible.value = false;
        isGyaradosVisible.value = false;
        isSquirtleWithGlasses.value = true;
        break;
      case 'magikarp':
        isSquirtleVisible.value = false;
        isSquirtleWithGlasses.value = false;
        isGyaradosVisible.value = false;
        isMagikarpVisible.value = true;
        break;
      case 'gyarados':
        isSquirtleVisible.value = false;
        isSquirtleWithGlasses.value = false;
        isMagikarpVisible.value = false;
        isGyaradosVisible.value = true;
        break;
    }
  }

  void actionSequenceOne() {
    isActionSequenceOneVisible.value = false;
    currentBattleText.value =
        'Squirtle: Vamoa calmarno mejor. Hagamos algo más productivo.';
    isActionSequenceTwoVisible.value = true;
  }

  void actionSequenceTwo() {
    isActionSequenceTwoVisible.value = false;
    setVisible('squirtle-sunglasses');
    currentBattleText.value = 'Squirtle: Vamoa contratar a Alex.';
    //isActionSequenceTwoVisible.value = true;
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/controllers/pokemon_slider_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class BattleController extends GetxController {
  PokemonSliderController pokemonSliderController =
      Get.put(PokemonSliderController());
  final isSquirtlePlaceholderVisible = true.obs;
  final isSquirtleVisible = true.obs;
  final isSquirtleWithGlasses = false.obs;
  final isMagikarpVisible = false.obs;
  final isGyaradosVisible = false.obs;

  final isActionSequenceOneVisible = true.obs;
  final isActionSequenceTwoVisible = false.obs;
  final isActionSequenceThreeVisible = false.obs;
  final isActionSequenceFourVisible = false.obs;
  final isActionSequenceFiveVisible = false.obs;
  final currentBattleText =
      'Un Squirtle salvaje ha aparecido con ganas de fiesta...'.obs;

  AssetImage image = const AssetImage('assets/images/animation_magikarp_2.gif');

  @override
  void dispose() {
    pokemonSliderController.generalController.assetsAudioPlayer.dispose();
    super.dispose();
  }

  void setVisible(whichOne) {
    switch (whichOne) {
      case 'squirtle':
        isSquirtleWithGlasses.value = false;
        isMagikarpVisible.value = false;
        isGyaradosVisible.value = false;
        isSquirtlePlaceholderVisible.value = true;
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
        isSquirtlePlaceholderVisible.value = false;
        isMagikarpVisible.value = true;
        break;
      case 'gyarados':
        isSquirtleVisible.value = false;
        isSquirtleWithGlasses.value = false;
        isGyaradosVisible.value = true;
        isMagikarpVisible.value = false;
        break;
    }
  }

  void actionSequenceZero() {
    isActionSequenceTwoVisible.value = false;
    isActionSequenceThreeVisible.value = false;
    isActionSequenceFourVisible.value = false;
    isActionSequenceFiveVisible.value = false;
    setVisible('squirtle');
    currentBattleText.value =
        'Un Squirtle salvaje ha aparecido con ganas de fiesta...';
    isActionSequenceOneVisible.value = true;
    image.evict();
  }

  void actionSequenceOne() {
    isActionSequenceOneVisible.value = false;
    currentBattleText.value =
        'Squirtle: Vamoa calmarno. La violencia nunca es la solución. Hagamos algo más productivo.';
    isActionSequenceTwoVisible.value = true;
  }

  void actionSequenceTwo() {
    isActionSequenceTwoVisible.value = false;
    setVisible('squirtle-sunglasses');
    currentBattleText.value = 'Squirtle: Vamoa contratar a Alex.';
    isActionSequenceThreeVisible.value = true;
  }

  void actionSequenceThree() {
    isActionSequenceThreeVisible.value = false;
    setVisible('magikarp');
    currentBattleText.value =
        'Usaste "Lo voy a pensar". No es un muy efectivo...';
    isActionSequenceFourVisible.value = true;
  }

  void actionSequenceFour() {
    isActionSequenceFourVisible.value = false;
    setVisible('gyarados');
    currentBattleText.value = 'Usaste "Contratar a Alex".\n ¡Es superefectivo!';
    isActionSequenceFiveVisible.value = true;
  }

  void actionSequenceFive() {
    launchWhatsApp();
  }

  void launchWhatsApp() async {
    var contact = "+595974243102";
    var androidUrl =
        "whatsapp://send?phone=$contact&text=¡Hola, Alex! Te escribo de BrosCo. ¿Crees que puedas venir a la ofi para hablar sobre tu contratación?";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('¡Hola, Alex! Te escribo de BrosCo. ¿Crees que puedas venir a la ofi para hablar sobre tu contratación?')}";
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } catch (e) {
      Get.snackbar('Error', 'Intalá WhatsApp para continuar',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.tealAccent);
      print(
          'WhatsApp is probably not installed/Error launching WhatsApp D: See more error details below:');
      print(e);
    }
  }
}

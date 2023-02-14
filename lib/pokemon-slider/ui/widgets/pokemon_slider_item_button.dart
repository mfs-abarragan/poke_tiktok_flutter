import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/app_constants.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/controllers/pokemon_slider_controller.dart';
import '../../../general/ui/styles/custom_colors.dart';
import '../../../general/ui/styles/general_styles.dart';

class PokemonSliderItemButton extends StatelessWidget {
  const PokemonSliderItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonSliderController pokemonSliderController =
        Get.put(PokemonSliderController());

    return Obx(
      () => InkWell(
        onTap: () {
          pokemonSliderController.tapButtonEffect();
          Get.toNamed('battle');
        },
        child: Row(
          children: [
            Expanded(
              child: Opacity(
                opacity: pokemonSliderController.itemButtonOpacity.value,
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: CustomColors.mainButtonColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text(
                      AppConstants.mainButtonText,
                      style: GeneralTextStyle(
                          fontFamily: 'Lato',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/app_constants.dart';
import 'package:poke_tiktok_flutter/general/ui/styles/general_styles.dart';
import '../../../pokemon-slider/controllers/pokemon_slider_controller.dart';
import '../../controllers/general_controller.dart';
import '../styles/custom_colors.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeneralController generalController = Get.put(GeneralController());
    PokemonSliderController pokemonSliderController =
        Get.put(PokemonSliderController());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    pokemonSliderController.getPokemons();

    return Scaffold(
      body: Obx(
        () => Container(
          padding: EdgeInsets.only(left: 18, right: 18),
          color: CustomColors.splashBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 58, right: 58),
                child: Image.asset('assets/images/squirtle.png'),
              ),
              Container(
                margin: EdgeInsets.only(top: 18),
                padding:
                    EdgeInsets.only(top: 12, bottom: 18, left: 12, right: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      generalController.splashMessage.value,
                      style: GeneralTextStyle(
                          fontFamily: 'Pokemon-Classic',
                          color: CustomColors.darkGray,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Visibility(
                      visible: generalController.splashMessage.value ==
                          AppConstants.splashLoadingText,
                      child: Container(
                        margin: EdgeInsets.only(top: 18),
                        child: SpinKitThreeBounce(
                            color: CustomColors.darkGray, size: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/app_constants.dart';
import 'package:poke_tiktok_flutter/general/ui/styles/general_styles.dart';
import 'package:poke_tiktok_flutter/pokemon-slider/controllers/pokemon_slider_controller.dart';
import '../../controllers/general_controller.dart';
import '../styles/custom_colors.dart';
import '../widgets/connection_error_snackbar.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeneralController generalController = Get.put(GeneralController());
    Get.put(PokemonSliderController());

    return Scaffold(
      body: Obx(
        () => Container(
          padding: EdgeInsets.only(left: 18, right: 18),
          color: CustomColors.splashBackground,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: generalController.isSplashContentVisible.value,
                    child: Padding(
                      padding: EdgeInsets.only(left: 72, right: 44),
                      child: FadeTransition(
                        opacity: generalController.animation,
                        child: Image.asset('assets/images/squirtle.png'),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: generalController.isSplashContentVisible.value,
                    child: Container(
                      margin: EdgeInsets.only(top: 18),
                      padding: EdgeInsets.only(
                          top: 12, bottom: 18, left: 12, right: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Text(
                            generalController
                                    .isConnectionErrorSnackbarVisible.value
                                ? AppConstants.connectionErrorText
                                : AppConstants.splashLoadingText,
                            style: GeneralTextStyle(
                                fontFamily: 'Pokemon-Classic',
                                color: CustomColors.darkGray,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !generalController.isSplashContentVisible.value,
                    child: Expanded(
                      child: Container(),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 58),
                alignment: Alignment.bottomCenter,
                child: ConnectionErrorSnackbar(
                  isVisible:
                      generalController.isConnectionErrorSnackbarVisible.value,
                  fromSplash: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

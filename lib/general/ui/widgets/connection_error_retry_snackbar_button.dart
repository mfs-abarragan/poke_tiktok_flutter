import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/general/controllers/general_controller.dart';

import '../../controllers/connection_error_snackbar_controller.dart';
import '../styles/general_styles.dart';

class ConnectionErrorSnackbarRetryButton extends StatelessWidget {
  final bool fromSplash;
  const ConnectionErrorSnackbarRetryButton({Key? key, this.fromSplash = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeneralController generalController = Get.put(GeneralController());
    ConnectionErrorSnackbarController connectionErrorSnackbarController =
        Get.put(ConnectionErrorSnackbarController());

    return Obx(
      () => InkWell(
        child: Container(
          child: connectionErrorSnackbarController.isRetryButtonLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(size: 20, color: Colors.blueAccent))
              : const Text(
                  'REINTENTAR',
                  style: GeneralTextStyle(
                      fontFamily: 'Lato', color: Colors.blueAccent),
                  textAlign: TextAlign.center,
                ),
        ),
        onTap: () async {
          if (!connectionErrorSnackbarController.isRetryButtonLoading.value &&
              fromSplash) {
            connectionErrorSnackbarController.retryLoadingPokemonFromSplash();
          }
          if (!connectionErrorSnackbarController.isRetryButtonLoading.value &&
              !fromSplash) {
            connectionErrorSnackbarController
                .retryLoadingPokemonFromSliderSnackBar();
          }
        },
      ),
    );
  }
}

// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:poke_tiktok_flutter/app_constants.dart';

class GeneralController extends GetxController {
  var dioService = Dio();

  final splashMessage = AppConstants.splashLoadingText.obs;

  void setSplashMessage(newValue) => splashMessage.value = newValue;

  String capitalize(String string) {
    if (string.isEmpty) {
      return string;
    }
    return string[0].toUpperCase() + string.substring(1);
  }
}

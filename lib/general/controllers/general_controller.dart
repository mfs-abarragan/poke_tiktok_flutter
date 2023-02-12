// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class GeneralController extends GetxController
    with GetTickerProviderStateMixin {
  var dioService = Dio();

  final isSplashContentVisible = true.obs;

  final isConnectionErrorSnackbarVisible = false.obs;

  late final AnimationController splashAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..forward();

  late final Animation<double> animation =
      CurveTween(curve: Curves.easeOutQuad).animate(splashAnimationController);

  void setIsSplashContentVisible(newValue) =>
      isSplashContentVisible.value = newValue;

  void setIsConnectionSnackbarVisible(newValue) =>
      isConnectionErrorSnackbarVisible.value = newValue;

  String capitalize(String string) {
    if (string.isEmpty) {
      return string;
    }
    return string[0].toUpperCase() + string.substring(1);
  }

  Future<bool> checkConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }
}

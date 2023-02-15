// ignore_for_file: file_names

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class GeneralController extends GetxController
    with GetTickerProviderStateMixin {
  var dioService = Dio();

  final assetsAudioPlayer = AssetsAudioPlayer.withId("0");

  final isSplashContentVisible = true.obs;

  final isConnectionErrorSnackbarVisible = false.obs;

  late final AnimationController splashAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..forward();

  late final Animation<double> animation =
      CurveTween(curve: Curves.easeOutQuad).animate(splashAnimationController);

  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    loadAudio();
  }

  @override
  void dispose() {
    super.dispose();
  }

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

  Future<void> loadAudio() async {
    try {
      await assetsAudioPlayer.open(
        Audio("assets/audio/pokemon_battle_soundtrack.mp3"),
      );
      await assetsAudioPlayer.stop();
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }
}

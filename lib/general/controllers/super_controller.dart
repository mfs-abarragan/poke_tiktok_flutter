import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/general/controllers/general_controller.dart';

class LifeCycleController extends SuperController {
  GeneralController generalController = Get.put(GeneralController());
  @override
  void onDetached() {
    generalController.assetsAudioPlayer.stop();
    generalController.assetsAudioPlayer.dispose();
  }

  @override
  void onInactive() {
    generalController.assetsAudioPlayer.stop();
    generalController.assetsAudioPlayer.dispose();
  }

  @override
  void onPaused() {
    generalController.assetsAudioPlayer.stop();
  }

  @override
  void onResumed() {
    generalController.assetsAudioPlayer.stop();
  }

  @override
  Future<bool> didPopRoute() {
    generalController.assetsAudioPlayer.stop();
    return super.didPopRoute();
  }

  @override
  void dispose() {
    super.dispose();
    generalController.assetsAudioPlayer.stop();
    generalController.assetsAudioPlayer.dispose();
  }
}

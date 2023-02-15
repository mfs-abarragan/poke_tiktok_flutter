import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_tiktok_flutter/battle/controllers/battle_controller.dart';

import '../../../general/ui/styles/general_styles.dart';

class BattleTextContainer extends StatelessWidget {
  const BattleTextContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BattleController battleController = Get.put(BattleController());

    return Obx(
      () => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 4, color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              battleController.currentBattleText.value,
              style: const GeneralTextStyle(fontFamily: 'Pokemon-Classic'),
            ),
            Visibility(
              visible: battleController.isActionSequenceOneVisible.value,
              child: InkWell(
                onTap: () => battleController.actionSequenceOne(),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 18),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: const Icon(Icons.play_arrow,
                                color: Colors.black, size: 28),
                          ),
                          Flexible(
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 12, bottom: 4),
                              child: const Text(
                                'Atacar',
                                style: GeneralTextStyle(
                                    fontFamily: 'Pokemon-Classic',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: battleController.isActionSequenceTwoVisible.value,
              child: InkWell(
                onTap: () => battleController.actionSequenceTwo(),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 18),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: const Icon(Icons.play_arrow,
                                color: Colors.black, size: 28),
                          ),
                          Flexible(
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 12, bottom: 4),
                              child: const Text(
                                'Sugiéreme algo más productivo',
                                style: GeneralTextStyle(
                                    fontFamily: 'Pokemon-Classic',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: battleController.isActionSequenceThreeVisible.value,
              child: InkWell(
                onTap: () => battleController.actionSequenceThree(),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 18),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: const Icon(Icons.play_arrow,
                                color: Colors.black, size: 28),
                          ),
                          Flexible(
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 12, bottom: 4),
                              child: const Text(
                                'Lo voy a pensar',
                                style: GeneralTextStyle(
                                    fontFamily: 'Pokemon-Classic',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: battleController.isActionSequenceFourVisible.value,
              child: InkWell(
                onTap: () => battleController.actionSequenceFour(),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 18),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: const Icon(Icons.play_arrow,
                                color: Colors.black, size: 28),
                          ),
                          Flexible(
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 12, bottom: 4),
                              child: const Text(
                                'Ok, contratar a Alex',
                                style: GeneralTextStyle(
                                    fontFamily: 'Pokemon-Classic',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: battleController.isActionSequenceFiveVisible.value,
              child: InkWell(
                onTap: () => battleController.actionSequenceFive(),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 18),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: const Icon(Icons.play_arrow,
                                color: Colors.black, size: 28),
                          ),
                          Flexible(
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 12, bottom: 4),
                              child: const Text(
                                'Continuar',
                                style: GeneralTextStyle(
                                    fontFamily: 'Pokemon-Classic',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

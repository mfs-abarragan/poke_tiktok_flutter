// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../general/ui/styles/custom_colors.dart';
import '../../../general/ui/styles/general_styles.dart';

class PokemonStatContainer extends StatelessWidget {
  String statName;
  String statPoints;
  Color typeColor;
  PokemonStatContainer(
      {Key? key,
      required this.statName,
      required this.statPoints,
      required this.typeColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 130,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: typeColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6)),
              ),
              child: Text(
                statName,
                style: const GeneralTextStyle(
                    fontFamily: 'Lato', color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 60,
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: CustomColors.mainBorderColor,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: Text(
              statPoints,
              style: const GeneralTextStyle(
                  fontFamily: 'Lato',
                  color: CustomColors.statPointsColor,
                  fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:poke_tiktok_flutter/app_constants.dart';

import '../../../general/ui/styles/custom_colors.dart';
import '../../../general/ui/styles/general_styles.dart';

class PokemonSliderItemButton extends StatelessWidget {
  const PokemonSliderItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
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
      ],
    );
  }
}

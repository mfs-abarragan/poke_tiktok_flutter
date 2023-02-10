import 'package:flutter/material.dart';
import 'package:poke_tiktok_flutter/app_constants.dart';

import '../../../general/ui/styles/general_styles.dart';

class ShowFavouritesButton extends StatelessWidget {
  const ShowFavouritesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InkWell(
      child: Text(
        AppConstants.showFavouritesText,
        style: GeneralTextStyle(
            fontFamily: 'Lato', color: Colors.white, fontSize: 16),
      ),
    );
  }
}

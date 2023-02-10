import 'package:flutter/material.dart';
import 'package:poke_tiktok_flutter/app_constants.dart';

import '../../../general/ui/styles/general_styles.dart';

class MarkFavouritesButton extends StatelessWidget {
  const MarkFavouritesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Image.asset('assets/images/ic_fav_button.png'),
      ),
    );
  }
}

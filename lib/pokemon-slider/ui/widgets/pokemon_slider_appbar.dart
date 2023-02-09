import 'package:flutter/material.dart';

import '../../../general/ui/styles/general_styles.dart';

class PokemonSliderAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PokemonSliderAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text('Probando', style: GeneralTextStyle()),
    );
  }
}

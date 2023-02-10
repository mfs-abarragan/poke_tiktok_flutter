import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:poke_tiktok_flutter/app_constants.dart';

import '../../../general/ui/styles/general_styles.dart';

class PokemonSliderItemSprite extends StatelessWidget {
  final String spriteUrl;

  const PokemonSliderItemSprite({Key? key, required this.spriteUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: spriteUrl,
        placeholder: (ontext, url) => Container(
          child: Text(''),
        ),
        errorWidget: (context, url, error) => Stack(
          children: [
            const Text(
              AppConstants.connectionErrorText,
              style: GeneralTextStyle(fontFamily: 'Lato'),
            ),
            Image.asset('assets/images/animation_magikarp_1.gif'),
          ],
        ),
      ),
    );
  }
}

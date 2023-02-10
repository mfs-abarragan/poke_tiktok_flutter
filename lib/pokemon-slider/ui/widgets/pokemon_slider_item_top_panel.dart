import 'package:flutter/material.dart';
import 'package:poke_tiktok_flutter/favourites/ui/widgets/mark_favourite_button.dart';
import 'package:poke_tiktok_flutter/favourites/ui/widgets/show_favourites_button.dart';

class PokemonSliderItemTopPanel extends StatelessWidget
    implements PreferredSizeWidget {
  const PokemonSliderItemTopPanel({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const ShowFavouritesButton(),
          Container(
            margin: const EdgeInsets.only(left: 12),
            child: const MarkFavouritesButton(),
          ),
        ],
      ),
    );
  }
}

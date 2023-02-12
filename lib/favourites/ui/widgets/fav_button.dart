import 'package:flutter/material.dart';

class MarkFavouritesButton extends StatelessWidget {
  const MarkFavouritesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InkWell(
      child: Center(
        child: Icon(Icons.favorite_outline, color: Colors.white, size: 28),
      ),
    );
  }
}

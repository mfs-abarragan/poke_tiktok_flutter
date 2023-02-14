// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:poke_tiktok_flutter/general/ui/styles/general_styles.dart';
import 'package:poke_tiktok_flutter/general/ui/widgets/connection_error_retry_snackbar_button.dart';

class ConnectionErrorSnackbar extends StatelessWidget {
  final bool isVisible;
  final bool fromSplash;
  ConnectionErrorSnackbar(
      {Key? key, required this.isVisible, this.fromSplash = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        height: 100,
        padding: const EdgeInsets.only(left: 18, right: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(3, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
              child:
                  Image.asset('assets/images/animation_magikarp_1_cropped.gif'),
            ),
            const Expanded(
              child: Text(
                'Sin internet',
                style: GeneralTextStyle(fontFamily: 'Lato'),
              ),
            ),
            Expanded(
              child: ConnectionErrorSnackbarRetryButton(fromSplash: fromSplash),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:blogapp/features/screens/home/home.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final String? positiveBtnText;
  final String? negativeBtnText;
  final Function? onPostivePressed;
  final Function? onNegativePressed;
  final double circularBorderRadius;

  const CustomAlertDialog({
    this.title,
    this.message,
    this.circularBorderRadius = 15.0,
    this.positiveBtnText,
    this.negativeBtnText,
    this.onPostivePressed,
    this.onNegativePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: message != null ? Text(message!) : null,
      backgroundColor: Theme.of(context).bottomAppBarColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[
        if (negativeBtnText != null)
          FlatButton(
            textColor: Theme.of(context).disabledColor,
            onPressed: () {
              Navigator.of(context).pop();
              if (onNegativePressed != null) {
                onNegativePressed!();
              }
            },
            child: Text(negativeBtnText!),
          ),
        if (positiveBtnText != null)
          FlatButton(
            textColor: Theme.of(context).disabledColor,
            onPressed: () {
              if (onPostivePressed != null) {
                onPostivePressed!();
              }
              Navigator.popAndPushNamed(context, HomeScreens.routeName);
            },
            child: Text(positiveBtnText!),
          )
      ],
    );
  }
}

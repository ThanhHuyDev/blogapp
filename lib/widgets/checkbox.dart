import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox(
      {Key? key,
      required this.text,
      required this.onchanged,
      required this.value})
      : super(key: key);
  final String text;
  final bool value;
  final Function(bool?)? onchanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onchanged),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}

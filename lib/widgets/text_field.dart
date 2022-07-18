import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.text, this.onchanged})
      : super(key: key);
  final String text;
  final Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: onchanged,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          filled: true,
          hintText: text,
          contentPadding:
              const EdgeInsets.only(bottom: 5.0, top: 12.5, left: 10),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
        ));
  }
}

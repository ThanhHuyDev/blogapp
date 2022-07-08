import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key, this.hinttext, this.labeltext, this.onchanged})
      : super(key: key);
  final String? labeltext;
  final String? hinttext;
  final Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TextFormField(
          onChanged: onchanged!,
          decoration: InputDecoration(
            enabledBorder: outlineInputBorder(),
            focusedBorder: outlineInputBorder(),
            border: outlineInputBorder(),
            labelText: labeltext,
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 16),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
            labelStyle: const TextStyle(fontSize: 17),
          )),
    );
  }

  outlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.black38));
  }
}

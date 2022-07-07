import 'package:flutter/material.dart';

class EditTopicInfomation extends StatelessWidget {
  const EditTopicInfomation({Key? key, required this.title, this.press})
      : super(key: key);
  final String title;
  final VoidCallback? press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: title,
            suffixIcon: const Icon(Icons.edit_outlined),
            contentPadding:
                const EdgeInsets.only(bottom: 5.0, top: 12.5, left: 7),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusColor: Colors.deepOrange,
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
          )),
    );
  }
}

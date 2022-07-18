import 'dart:io';

import 'package:flutter/material.dart';

class ImageUpload extends StatelessWidget {
  final String? photoUrl;
  final String? defaultLetter;
  final double? size;
  final BorderRadius? borderRadius;
  final Color? background;
  final File? imageFile;
  final double? height;
  final double? width;
  final String? placeholder;

  const ImageUpload({
    Key? key,
    this.photoUrl,
    this.defaultLetter,
    this.size,
    this.borderRadius,
    this.background,
    this.imageFile,
    this.width,
    this.height,
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: imageFile != null
          ? Image.file(
              imageFile!,
              fit: BoxFit.cover,
              width: width ?? size,
              height: height ?? size,
            )
          : (photoUrl != null && photoUrl != ''
              ? Image.network(
                  photoUrl ?? '',
                  fit: BoxFit.cover,
                  width: width ?? size,
                  height: height ?? size,
                )
              : defaultLetter != null && defaultLetter != ''
                  ? Center(
                      child: Text(
                        defaultLetter ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        placeholder ?? 'assets/images/profile.png',
                        width: size,
                        height: size,
                        fit: BoxFit.cover,
                        color: Colors.blueGrey[200],
                      ),
                    )),
    );
  }
}

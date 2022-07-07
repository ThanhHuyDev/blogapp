import 'dart:io';

import 'package:blogapp/widgets/avatar.dart';
import 'package:flutter/material.dart';

class ImageSetup extends StatelessWidget {
  const ImageSetup({Key? key, this.imageUrl, this.press}) : super(key: key);

  final String? imageUrl;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        (imageUrl == null)
            ? Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.o5hnVgDkhrAIKPAUMAtzcAHaHa?pid=ImgDet&rs=1'),
                  ),
                  Positioned(
                    bottom: -4,
                    right: -4,
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          width: 2.5,
                          color: Colors.white,
                        ),
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.deepPurple,
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          onTap: press,
                          borderRadius: BorderRadius.circular(100),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            : Avatar(
                size: 100,
                imageFile: File(imageUrl!),
              )
      ],
    );
  }
}

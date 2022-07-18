import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/services/firebase/storage/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {Key? key, this.imageUrl, this.height, this.width, this.user})
      : super(key: key);
  final String? imageUrl;
  final double? height;
  final double? width;
  final UserApp? user;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: (imageUrl == null)
            ? Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Theme.of(context).primaryColorDark, width: 1)),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () async {
                      ImagePicker? picker = ImagePicker();
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (image == null) {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('No image selected')));
                      }
                      if (image != null) {
                        // ignore: avoid_print
                        print('uploading..');
                        // ignore: use_build_context_synchronously
                        StorageRepository().uploadImage(user!, image);
                      }
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.red,
                    ),
                  ),
                ))
            : Container(
                height: 150,
                width: 103,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: const Border(
                      bottom: BorderSide(color: Colors.black, width: 1),
                      top: BorderSide(color: Colors.black, width: 1),
                      left: BorderSide(color: Colors.black, width: 1),
                      right: BorderSide(color: Colors.black, width: 1),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl!), fit: BoxFit.cover)),
              ));
  }
}

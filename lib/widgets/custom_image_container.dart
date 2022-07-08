import 'package:blogapp/features/screens/onboarding/presentasions/bloc/onloading/onloading_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({Key? key, this.imageUrl}) : super(key: key);
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: (imageUrl == null)
            ? Container(
                height: 150,
                width: 103,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: const Border(
                      bottom: BorderSide(color: Colors.black, width: 1),
                      top: BorderSide(color: Colors.black, width: 1),
                      left: BorderSide(color: Colors.black, width: 1),
                      right: BorderSide(color: Colors.black, width: 1),
                    )),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () async {
                      ImagePicker? _picker = ImagePicker();
                      final XFile? _image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (_image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('No image selected')));
                      }
                      if (_image != null) {
                        print('uploading..');
                        // ignore: use_build_context_synchronously
                        context
                            .read<OnloadingBloc>()
                            .add(UpdateUserImages(image: _image));
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

import 'package:blogapp/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../features/screens/onboarding/presentasions/bloc/onloading/onloading_bloc.dart';

class ImageSetup extends StatelessWidget {
  const ImageSetup({Key? key, this.imageUrl}) : super(key: key);
  final String? imageUrl;
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
                          onTap: () async {
                            ImagePicker? picker = ImagePicker();
                            final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (image == null) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('No image selected')));
                            }
                            if (image != null) {
                              // ignore: avoid_print
                              print('uploading..');
                              // ignore: use_build_context_synchronously
                              context
                                  .read<OnloadingBloc>()
                                  .add(UpdateUserImageAvatar(image: image));
                            }
                          },
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
                photoUrl: imageUrl,
              )
      ],
    );
  }
}

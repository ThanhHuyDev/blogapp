import 'dart:io';
import 'package:blogapp/entities/models/post_model.dart';
import 'package:blogapp/features/screens/home/home.dart';
import 'package:blogapp/features/screens/upload_post/presentasions/widgets/image_upload.dart';
import 'package:blogapp/services/firebase/firestore_reponsitory/post_status/post_status_reponsitory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../../../services/firebase/storage/storage_repository.dart';
import '../widgets/alertdialog.dart';

class UploadPost extends StatefulWidget {
  const UploadPost({Key? key}) : super(key: key);
  static const String routeName = '/uploadpost';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const UploadPost());
  }

  @override
  State<UploadPost> createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost> {
  XFile? image;
  ImagePicker? picker;
  TextEditingController captionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        centerTitle: true,
        title: const Text('Tạo bài viết'),
        leading: IconButton(
            onPressed: () {
              var dialog = CustomAlertDialog(
                  message: "Chưa tạo bài đăng xong. Thoát khỏi trang này?",
                  onPostivePressed: () {},
                  positiveBtnText: 'Thoát',
                  negativeBtnText: 'Ở lại');
              showDialog(
                  context: context, builder: (BuildContext context) => dialog);
            },
            icon: const Icon(Icons.clear)),
        actions: [
          InkWell(
            onTap: () async {
              final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
              final String uid = firebaseAuth.currentUser!.uid;
              String timePost = DateFormat().add_yMMMd().format(DateTime.now());
              Post post = Post(
                  idUser: uid,
                  caption: captionController.text,
                  imagePost: '',
                  id: image!.name,
                  time: timePost);
              await PostStatusReponsitory().createPostStatus(post);
              if (image == null) {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No image selected')));
              }
              if (image != null) {
                // ignore: avoid_print
                print('uploading..');
                StorageRepository().uploadImagePost(post, image!);
              }
              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, HomeScreens.routeName);
            },
            child: Container(
              width: 70,
              padding: const EdgeInsets.only(bottom: 4, left: 3),
              margin: const EdgeInsets.only(top: 8, bottom: 8, right: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(9)),
              child: const Center(
                  child: Text(
                'Đăng',
                style: TextStyle(fontSize: 17),
              )),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                TextField(
                  controller: captionController,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: 'Bạn đang nghỉ gì ?',
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: 10, right: 10, top: 20)),
                  minLines: 1,
                  maxLines: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: (image != null)
                      ? ImageUpload(
                          imageFile: File(image!.path),
                        )
                      : const SizedBox(
                          height: 300,
                          width: double.infinity,
                        ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          blurRadius: 7,
                          spreadRadius: 2,
                          offset: const Offset(2, 2)),
                    ],
                    color: Theme.of(context).bottomAppBarColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        picker = ImagePicker();
                        final result =
                            await picker?.pickImage(source: ImageSource.camera);
                        if (result == null) return;
                        setState(() {
                          image = result;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/icons/ic_camera.svg',
                        height: 25,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        picker = ImagePicker();
                        final result = await picker?.pickImage(
                            source: ImageSource.gallery);
                        if (result == null) return;
                        setState(() {
                          image = result;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/icons/ic_image.svg',
                        height: 30,
                        color: Colors.grey.withOpacity(0.7),
                      ),
                    ),
                    SvgPicture.asset('assets/icons/ic_user.svg', height: 25),
                    SvgPicture.asset('assets/icons/ic_location.svg',
                        height: 25),
                    SvgPicture.asset('assets/icons/ic_mess.svg', height: 25)
                  ],
                )),
          )
        ],
      ),
    );
  }
}

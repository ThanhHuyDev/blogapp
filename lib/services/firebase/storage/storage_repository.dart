import 'dart:io';
import 'package:blogapp/services/firebase/firebase_reponsitory/user/user_reponsitory.dart';
import 'package:blogapp/services/firebase/storage/base_storage_repository.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class StorageRepository extends BaseStorageRepository {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  @override
  Future<void> uploadImage(XFile image) async {
    try {
      await storage
          .ref('user_image/${image.name}')
          .putFile(File(image.path))
          .then((p0) => UserReponsitory().updateUserPictures(image.name));
    } catch (_) {}
  }

  @override
  Future<String> getDownloadURL(String imageName) async {
    String downloadURL =
        await storage.ref('user_image/${imageName}').getDownloadURL();
    return downloadURL;
  }

  //  @override
  // Future<void> uploadImageAvatar(XFile imageAvatar) async {
  //   try {
  //     await storage
  //         .ref('user_avatar/${imageAvatar.name}')
  //         .putFile(File(imageAvatar.path))
  //         .then((p0) => AuthenticationProvider().updateUserAvatar(imageAvatar.name));
  //   } catch (_) {}
  // }

  // @override
  // Future<String> getDownloadURLAvatar(String imageAvatar) async {
  //   String downloadURLAvatar =
  //       await storage.ref('user_avatar/${imageAvatar}').getDownloadURL();
  //   return downloadURLAvatar;
  // }
}

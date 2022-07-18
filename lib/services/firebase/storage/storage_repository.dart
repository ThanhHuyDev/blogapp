import 'dart:io';
import 'package:blogapp/entities/models/post_model.dart';
import 'package:blogapp/services/firebase/firestore_reponsitory/post_status/post_status_reponsitory.dart';
import 'package:blogapp/services/firebase/firestore_reponsitory/user/user_reponsitory.dart';
import 'package:blogapp/services/firebase/storage/base_storage_repository.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

import '../../../entities/models/user_model.dart';

class StorageRepository extends BaseStorageRepository {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  @override
  Future<void> uploadImage(UserApp user, XFile image) async {
    try {
      await storage
          .ref('${user.id}/${image.name}')
          .putFile(File(image.path))
          .then((p0) => UserReponsitory().updateUserPictures(image.name, user));
    } catch (_) {}
  }

  @override
  Future<String> getDownloadURL(UserApp user, String imageName) async {
    String downloadURL =
        await storage.ref('${user.id}/$imageName').getDownloadURL();
    return downloadURL;
  }

  @override
  Future<void> uploadImageAvatar(UserApp user, XFile imageAvatar) async {
    try {
      await storage
          .ref('user_avatar/${imageAvatar.name}')
          .putFile(File(imageAvatar.path))
          .then((p0) =>
              UserReponsitory().updateUserAvatar(imageAvatar.name, user));
    } catch (_) {}
  }

  @override
  Future<String> getDownloadURLAvatar(UserApp user, String imageAvatar) async {
    String downloadURLAvatar =
        await storage.ref('user_avatar/$imageAvatar').getDownloadURL();
    return downloadURLAvatar;
  }

  @override
  Future<String> getDownloadURLPost(Post post, String imagePost) async {
    String downloadURLPost =
        await storage.ref('user_post/$imagePost').getDownloadURL();
    return downloadURLPost;
  }

  @override
  Future<void> uploadImagePost(Post post, XFile imagePost) async {
    try {
      await storage
          .ref('user_post/${imagePost.name}')
          .putFile(File(imagePost.path))
          .then((p0) => PostStatusReponsitory()
              .updateImagePostStatus(imagePost.name, post));
    } catch (_) {}
  }
}

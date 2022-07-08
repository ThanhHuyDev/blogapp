import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/services/firebase/firebase_reponsitory/user/base_user_reponsitory.dart';
import 'package:blogapp/services/firebase/storage/storage_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserReponsitory extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserReponsitory({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<String> createUser(UserApp user) async {
    final firebaseUser = _firebaseAuth.currentUser;
    String documnetId = await _firebaseFirestore
        .collection('users')
        .add(user.toDocument())
        .then((value) {
      print('User added, ID: ${value.id}');
      return value.id;
    });
    return documnetId;
  }

  @override
  Future<void> updateUser(UserApp user) {
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toDocument())
        .then((value) => print('User document updated'));
  }

  @override
  Stream<UserApp> getUser(String userId) {
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snap) => UserApp.fromSnapshot(snap));
  }

  @override
  Future<void> updateUserPictures(String imageName, UserApp user) async {
    String downloadUrl =
        await StorageRepository().getDownloadURL(user, imageName);
    return FirebaseFirestore.instance.collection('users').doc(user.id).update({
      'imageUrl': FieldValue.arrayUnion([downloadUrl]),
    });
  }

  @override
  Future<void> updateUserAvatar(String imageAvatar, UserApp user) async {
    String downloadUrlAvatar =
        await StorageRepository().getDownloadURLAvatar(imageAvatar);
    return FirebaseFirestore.instance
        .collection('users')
        .doc()
        .update({'imageAvatar': downloadUrlAvatar});
  }
}

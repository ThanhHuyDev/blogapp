import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/services/firebase/firestore_reponsitory/user/base_user_reponsitory.dart';
import 'package:blogapp/services/firebase/storage/storage_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserReponsitory extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserReponsitory({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createUser(UserApp user) async {
    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .set(user.toDocument());
  }

  @override
  Future<void> updateUser(UserApp user) {
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toDocument())
        // ignore: avoid_print
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
        await StorageRepository().getDownloadURLAvatar(user, imageAvatar);
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.id)
        .update({'imageAvatar': downloadUrlAvatar});
  }

  @override
  Stream<UserApp> getUserHome() {
    final firebaseUser = _firebaseAuth.currentUser;
    return _firebaseFirestore
        .collection('users')
        .doc(firebaseUser!.uid)
        .snapshots()
        .map((snap) => UserApp.fromSnapshot(snap));
  }
}

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
  Future<void> saveUserFirestore(UserApp user) async {
    return await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .set(user.toDocument(), SetOptions(merge: true));
  }

  @override
  Stream<UserApp> getUser(String userId) {
    return _firebaseFirestore
        .collection('users')
        .doc()
        .snapshots()
        .map((snap) => UserApp.fromSnapshot(snap));
  }

  @override
  Future<void> updateUser(UserApp user) async {
    return await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toDocument())
        .then((value) => print('user document updated'));
  }

  @override
  Future<void> updateUserPictures(String imageName) async {
    String downloadUrl = await StorageRepository().getDownloadURL(imageName);
    final firebaseUser = _firebaseAuth.currentUser;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .update({
      'imageUrl': FieldValue.arrayUnion([downloadUrl]),
    });
  }

  @override
  Future<void> updateUserAvatar(String imageAvatar) async {
    String downloadUrlAvatar =
        await StorageRepository().getDownloadURLAvatar(imageAvatar);
    final firebaseUser = _firebaseAuth.currentUser;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .update({'imageAvatar': downloadUrlAvatar});
  }

  @override
  Stream<UserApp> getUserImage() {
    final firebaseUser = _firebaseAuth.currentUser;
    return _firebaseFirestore
        .collection('users')
        .doc(firebaseUser!.uid)
        .snapshots()
        .map((snap) => UserApp.fromSnapshot(snap));
  }
}

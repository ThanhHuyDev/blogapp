import 'package:blogapp/entities/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../entities/models/post_model.dart';
import '../../storage/storage_repository.dart';
import 'base_post_status_reponsitory.dart';

class PostStatusReponsitory extends BasePostStatusRepository {
  final FirebaseFirestore _firebaseFirestore;
  PostStatusReponsitory({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createPostStatus(Post post) {
    return _firebaseFirestore
        .collection('posts')
        .doc(post.id)
        .set(post.toJson(), SetOptions(merge: true));
  }

  @override
  Future<void> updatePostStatus(UserApp user) {
    // TODO: implement updatePostStatus
    throw UnimplementedError();
  }

  @override
  Future<void> updateImagePostStatus(String imagePost, Post post) async {
    String downloadUrlPost =
        await StorageRepository().getDownloadURLPost(post, imagePost);
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(post.id)
        .update({'imagePost': downloadUrlPost});
  }

  @override
  Stream<List<Post>> getPostHome() {
    return _firebaseFirestore
        .collection('posts')
        .snapshots()
        .map((snap) => snap.docs.map((doc) => Post.fromJson(doc)).toList());
  }

  @override
  Stream<UserApp> getUserPost(String postId) {
    return _firebaseFirestore
        .collection('users')
        .doc(postId)
        .snapshots()
        .map((snap) => UserApp.fromSnapshot(snap));
  }
}

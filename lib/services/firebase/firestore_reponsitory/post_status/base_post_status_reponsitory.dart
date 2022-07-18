import '../../../../entities/models/post_model.dart';
import '../../../../entities/models/user_model.dart';

abstract class BasePostStatusRepository {
  Future<void> createPostStatus(Post post);
  Stream<List<Post>> getPostHome();
  Stream<UserApp> getUserPost(String postId);
  Future<void> updatePostStatus(UserApp user);
  Future<void> updateImagePostStatus(String imagePost, Post post);
}

import 'package:image_picker/image_picker.dart';

import '../../../entities/models/post_model.dart';
import '../../../entities/models/user_model.dart';

abstract class BaseStorageRepository {
  Future<void> uploadImage(UserApp user, XFile image);
  Future<String> getDownloadURL(UserApp user, String imageName);
  Future<void> uploadImageAvatar(UserApp user, XFile imageAvatar);
  Future<String> getDownloadURLAvatar(UserApp user, String imageAvatar);
  Future<void> uploadImagePost(Post post, XFile imagePost);
  Future<String> getDownloadURLPost(Post post, String imagePost);
}

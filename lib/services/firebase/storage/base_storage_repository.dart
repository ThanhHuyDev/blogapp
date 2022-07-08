import 'package:image_picker/image_picker.dart';

import '../../../entities/models/user_model.dart';

abstract class BaseStorageRepository {
  Future<void> uploadImage(UserApp user, XFile image);
  Future<String> getDownloadURL(UserApp user, String imageName);
  Future<void> uploadImageAvatar(XFile imageAvatar);
  Future<String> getDownloadURLAvatar(String imageAvatar);
}

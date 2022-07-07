import 'package:image_picker/image_picker.dart';

abstract class BaseStorageRepository {
  Future<void> uploadImage(XFile image);
  Future<String> getDownloadURL(String imageName);
  // Future<void> uploadImageAvatar(XFile imageAvatar);
  // Future<String> getDownloadURLAvatar(String imageAvatar);
}

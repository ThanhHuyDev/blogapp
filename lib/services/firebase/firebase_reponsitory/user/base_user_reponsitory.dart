import '../../../../entities/models/user_model.dart';

abstract class BaseUserRepository {
  Stream<UserApp> getUser(String userId);
  Stream<UserApp> getUserImage();

  Future<void> saveUserFirestore(UserApp user);
  Future<void> updateUser(UserApp user);

  Future<void> updateUserPictures(String imageName);
  Future<void> updateUserAvatar(String imageAvatar);
}

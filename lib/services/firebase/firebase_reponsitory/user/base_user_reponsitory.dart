import 'package:firebase_auth/firebase_auth.dart';

import '../../../../entities/models/user_model.dart';

abstract class BaseUserRepository {
  Stream<UserApp> getUser(String userId);
  Future<String> createUser(UserApp user);
  Future<void> updateUser(UserApp user);

  Future<void> updateUserPictures(String imageName, UserApp user);
  Future<void> updateUserAvatar(String imageAvatar, UserApp user);
}

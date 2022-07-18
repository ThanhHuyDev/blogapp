part of 'user_post_bloc.dart';

abstract class UserPostEvent extends Equatable {
  const UserPostEvent();

  @override
  List<Object> get props => [];
}

class LoadUserPosts extends UserPostEvent {
  final String postId;
  const LoadUserPosts({required this.postId});

  @override
  List<Object> get props => [postId];
}

class UpdateUserPosts extends UserPostEvent {
  final UserApp user;
  const UpdateUserPosts({required this.user});

  @override
  List<Object> get props => [user];
}

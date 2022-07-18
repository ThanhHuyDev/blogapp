part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class LoadPosts extends PostEvent {
  final String postId;
  const LoadPosts({required this.postId});

  @override
  List<Object> get props => [postId];
}

class UpdatePosts extends PostEvent {
  final List<Post> posts;
  final UserApp user;
  const UpdatePosts({required this.posts, required this.user});

  @override
  List<Object> get props => [posts, user];
}

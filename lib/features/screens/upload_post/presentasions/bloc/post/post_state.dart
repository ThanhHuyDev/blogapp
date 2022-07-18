part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class Loading extends PostState {}

class Loaded extends PostState {
  final List<Post> posts;
  final UserApp user;
  const Loaded({required this.posts, required this.user});

  @override
  List<Object> get props => [posts, user];
}

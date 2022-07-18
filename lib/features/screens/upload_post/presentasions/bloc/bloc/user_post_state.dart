part of 'user_post_bloc.dart';

abstract class UserPostState extends Equatable {
  const UserPostState();

  @override
  List<Object> get props => [];
}

class Loadingg extends UserPostState {}

class Loadedd extends UserPostState {
  final UserApp user;
  const Loadedd({required this.user});

  @override
  List<Object> get props => [user];
}

part of 'profile_home_bloc.dart';

abstract class ProfileHomeState extends Equatable {
  const ProfileHomeState();

  @override
  List<Object> get props => [];
}

class ProfileLoadingg extends ProfileHomeState {}

class ProfileLoadedd extends ProfileHomeState {
  final UserApp user;
  const ProfileLoadedd({required this.user});

  @override
  List<Object> get props => [user];
}

part of 'profile_home_bloc.dart';

abstract class ProfileHomeEvent extends Equatable {
  const ProfileHomeEvent();

  @override
  List<Object> get props => [];
}

class LoadProfilee extends ProfileHomeEvent {
  const LoadProfilee();

  @override
  List<Object> get props => [];
}

class UpdateProfilee extends ProfileHomeEvent {
  final UserApp user;
  const UpdateProfilee({required this.user});

  @override
  List<Object> get props => [user];
}

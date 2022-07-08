part of 'onloading_bloc.dart';

abstract class OnloadingEvent extends Equatable {
  const OnloadingEvent();

  @override
  List<Object?> get props => [];
}

class StartOnloading extends OnloadingEvent {}

class UpdateUser extends OnloadingEvent {
  final UserApp user;
  const UpdateUser({required this.user});
  @override
  List<Object?> get props => [user];
}

class UpdateUserImages extends OnloadingEvent {
  final UserApp? user;
  final XFile image;
  const UpdateUserImages({this.user, required this.image});
  @override
  List<Object?> get props => [user, image];
}
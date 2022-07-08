part of 'onloading_bloc.dart';

abstract class OnloadingState extends Equatable {
  const OnloadingState();

  @override
  List<Object> get props => [];
}

class Onloading extends OnloadingState {}

class Onloaded extends OnloadingState {
  final UserApp user;
  const Onloaded({required this.user});

  @override
  List<Object> get props => [user];
}

part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthUserChanged extends AuthEvent {
  final auth.User? userAuth;
  final UserApp? user;
  const AuthUserChanged({this.user, required this.userAuth});

  @override
  List<Object> get props => [user!, userAuth!];
}

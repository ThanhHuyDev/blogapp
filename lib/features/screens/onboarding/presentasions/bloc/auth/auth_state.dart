part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus status;
  final auth.User? userAuth;
  const AuthState._({this.status = AuthStatus.unknown, this.userAuth});

  const AuthState.unknown() : this._();
  const AuthState.authenticated({required auth.User userAuth})
      : this._(status: AuthStatus.authenticated, userAuth: userAuth);
  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  @override
  List<Object> get props => [status, userAuth!];
}

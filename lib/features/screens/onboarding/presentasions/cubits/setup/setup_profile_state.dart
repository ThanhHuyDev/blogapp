// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'setup_profile_cubit.dart';

enum LoginStatus {
  initial,
  submitting,
  success,
  error,
}

class LoginState extends Equatable {
  final String email;
  final String password;
  final auth.User? user;
  final LoginStatus status;
  const LoginState(
      {this.user,
      required this.status,
      required this.email,
      required this.password});
  bool get isValid => email.isNotEmpty && password.isNotEmpty;
  @override
  List<Object?> get props => [user, email, password, status];

  factory LoginState.initial() {
    return const LoginState(
        email: '', password: '', status: LoginStatus.initial, user: null);
  }
  @override
  bool get stringify => true;

  LoginState copyWith(
      {String? email, String? password, LoginStatus? status, auth.User? user}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        user: user ?? this.user);
  }
}

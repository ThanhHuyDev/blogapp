part of 'signup_cubit.dart';

enum SignupStatus {
  initial,
  submitting,
  success,
  error,
}

class SignupState extends Equatable {
  final String email;
  final String password;
  final SignupStatus status;
  final auth.User? userAuth;
  const SignupState(
      {required this.email,
      required this.password,
      required this.status,
      this.userAuth});

  factory SignupState.initial() {
    return const SignupState(
        email: '', password: '', status: SignupStatus.initial, userAuth: null);
  }

  @override
  List<Object?> get props => [email, password, status, userAuth];

  SignupState copyWith(
      {String? email,
      String? password,
      SignupStatus? status,
      auth.User? userAuth}) {
    return SignupState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        userAuth: userAuth ?? this.userAuth);
  }

  bool get isValid => email.isNotEmpty && password.isNotEmpty;
}

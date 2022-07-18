import 'package:blogapp/services/firebase/firestore_reponsitory/auth/auth_reponsitory.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../bloc/export_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthReponsitory _authReponsitory;
  SignupCubit({required AuthReponsitory authReponsitory})
      : _authReponsitory = authReponsitory,
        super(SignupState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignupStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignupStatus.initial));
  }

  Future<void> signupWithCredentials() async {
    if (!state.isValid) return;
    try {
      var user = await _authReponsitory.signUp(
          email: state.email, password: state.password);
      emit(state.copyWith(status: SignupStatus.success, userAuth: user));
    } catch (_) {}
  }
}

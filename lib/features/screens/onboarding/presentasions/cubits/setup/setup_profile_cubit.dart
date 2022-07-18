import 'package:blogapp/services/firebase/firestore_reponsitory/auth/auth_reponsitory.dart';
import 'package:equatable/equatable.dart';
import '../../bloc/export_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'setup_profile_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthReponsitory _authReponsitory;
  LoginCubit({required AuthReponsitory authReponsitory})
      : _authReponsitory = authReponsitory,
        super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  Future<void> loginWithCredentials() async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _authReponsitory.logInWithEmailAndPassword(
          email: state.email, password: state.password);
      emit(state.copyWith(status: LoginStatus.success));
    } catch (_) {}
  }
}

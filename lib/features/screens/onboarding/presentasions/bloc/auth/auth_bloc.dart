import 'dart:async';
import 'package:blogapp/services/firebase/firebase_reponsitory/auth/auth_reponsitory.dart';
import 'package:blogapp/services/firebase/firebase_reponsitory/user/user_reponsitory.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../export_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthReponsitory _authReponsitory;
  StreamSubscription<auth.User?>? _userAuthSubscription;

  AuthBloc({
    required AuthReponsitory authReponsitory,
  })  : _authReponsitory = authReponsitory,
        super(const AuthState.unknown()) {
    on<AuthUserChanged>(_onAuthUserChanged);

    _userAuthSubscription = _authReponsitory.user.listen((authUser) {
      add(AuthUserChanged(userAuth: authUser));
    });
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    event.userAuth != null
        ? emit(AuthState.authenticated(userAuth: event.userAuth!))
        : emit(const AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _userAuthSubscription?.cancel();
    return super.close();
  }
}

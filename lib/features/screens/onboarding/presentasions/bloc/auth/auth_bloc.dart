import 'dart:async';
import 'package:blogapp/services/firebase/firebase_reponsitory/auth/auth_reponsitory.dart';
import 'package:blogapp/services/firebase/firebase_reponsitory/user/user_reponsitory.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../../../../entities/models/user_model.dart';
import '../export_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthReponsitory _authReponsitory;
  final UserReponsitory _userReponsitory;

  StreamSubscription<auth.User?>? _userAuthSubscription;
  StreamSubscription<UserApp?>? _userSubscription;

  AuthBloc(
      {required AuthReponsitory authReponsitory,
      required UserReponsitory userReponsitory})
      : _authReponsitory = authReponsitory,
        _userReponsitory = userReponsitory,
        super(const AuthState.unknown()) {
    on<AuthUserChanged>(_onAuthUserChanged);

    _userAuthSubscription = _authReponsitory.user.listen((authUser) {
      print('Auth user: $authUser');
      if (authUser != null) {
        _userReponsitory.getUser(authUser.uid).listen((user) {
          add(AuthUserChanged(user: user, userAuth: authUser));
        });
      } else {
        add(AuthUserChanged(userAuth: authUser));
      }
    });
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    event.userAuth != null
        ? emit(AuthState.authenticated(
            userAuth: event.userAuth!, user: event.user!))
        : emit(const AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _userAuthSubscription?.cancel();
    _userSubscription?.cancel();
    return super.close();
  }
}

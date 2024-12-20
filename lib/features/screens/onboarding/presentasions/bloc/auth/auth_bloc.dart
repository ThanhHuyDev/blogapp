import 'dart:async';
import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/services/firebase/firestore_reponsitory/auth/auth_reponsitory.dart';
import 'package:blogapp/services/firebase/firestore_reponsitory/user/user_reponsitory.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../export_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthReponsitory _authReponsitory;
  final UserReponsitory _userReponsitory;
  StreamSubscription<auth.User?>? _userAuthSubscription;
  StreamSubscription<UserApp?>? _userSubscription;

  AuthBloc({
    required AuthReponsitory authReponsitory,
    required UserReponsitory userReponsitory,
  })  : _authReponsitory = authReponsitory,
        _userReponsitory = userReponsitory,
        super(const AuthState.unknown()) {
    on<AuthUserChanged>(_onAuthUserChanged);

    _userAuthSubscription = _authReponsitory.user.listen((userAuth) {
      if (userAuth != null) {
        _userReponsitory.getUser(userAuth.uid).listen((user) {
          add(AuthUserChanged(userAuth: userAuth, user: user));
        });
      } else {
        add(AuthUserChanged(userAuth: userAuth));
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

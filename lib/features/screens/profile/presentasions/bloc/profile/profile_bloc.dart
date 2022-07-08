import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/bloc/auth/auth_bloc.dart';
import 'package:blogapp/services/firebase/firebase_reponsitory/user/user_reponsitory.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthBloc _authBloc;
  final UserReponsitory _userReponsitory;
  StreamSubscription? _authSubscription;
  ProfileBloc(
      {required AuthBloc authBloc, required UserReponsitory userReponsitory})
      : _authBloc = authBloc,
        _userReponsitory = userReponsitory,
        super(ProfileLoading()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);

    _authSubscription = _authBloc.stream.listen((state) {
      if (state.userAuth != null) {
        add(LoadProfile(userId: state.userAuth!.uid));
      }
    });
  }

  void _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) {
    _userReponsitory.getUser(event.userId).listen((user) {
      add(UpdateProfile(user: user));
    });
  }

  void _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) {
    emit(ProfileLoaded(user: event.user));
  }

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    super.close();
  }
}

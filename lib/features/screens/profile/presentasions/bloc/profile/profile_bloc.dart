import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/bloc/auth/auth_bloc.dart';
import 'package:blogapp/services/firebase/firestore_reponsitory/user/user_reponsitory.dart';
import 'package:equatable/equatable.dart';

import '../../../../settings/presentasions/bloc/export_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserReponsitory _userReponsitory;

  ProfileBloc(
      {required AuthBloc authBloc, required UserReponsitory userReponsitory})
      : _userReponsitory = userReponsitory,
        super(ProfileLoading()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  void _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) {
    _userReponsitory
        .getUser(event.userId)
        .listen((user) => add(UpdateProfile(user: user)));
  }

  void _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) {
    emit(ProfileLoaded(user: event.user));
  }
}

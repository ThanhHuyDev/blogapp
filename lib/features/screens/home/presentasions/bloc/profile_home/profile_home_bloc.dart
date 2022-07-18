import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/features/screens/onboarding/presentasions/bloc/auth/auth_bloc.dart';
import 'package:blogapp/services/firebase/firestore_reponsitory/user/user_reponsitory.dart';
import 'package:equatable/equatable.dart';

import '../../../../settings/presentasions/bloc/export_bloc.dart';

part 'profile_home_event.dart';
part 'profile_home_state.dart';

class ProfileHomeBloc extends Bloc<ProfileHomeEvent, ProfileHomeState> {
  final UserReponsitory _userReponsitory;
  ProfileHomeBloc(
      {required AuthBloc authBloc, required UserReponsitory userReponsitory})
      : _userReponsitory = userReponsitory,
        super(ProfileLoadingg()) {
    on<LoadProfilee>(_onLoadProfile);
    on<UpdateProfilee>(_onUpdateProfile);
  }

  void _onLoadProfile(LoadProfilee event, Emitter<ProfileHomeState> emit) {
    _userReponsitory
        .getUserHome()
        .listen((user) => add(UpdateProfilee(user: user)));
  }

  void _onUpdateProfile(UpdateProfilee event, Emitter<ProfileHomeState> emit) {
    emit(ProfileLoadedd(user: event.user));
  }
}

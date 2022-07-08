import 'package:equatable/equatable.dart';

import '../../../../../../entities/models/user_model.dart';
import '../../../../../../services/firebase/firebase_reponsitory/user/user_reponsitory.dart';
import '../../bloc/export_bloc.dart';

part 'setup_profile_state.dart';

class SetupProfileCubit extends Cubit<SetupProfileState> {
  final UserReponsitory _userReponsitory;
  SetupProfileCubit({required UserReponsitory userReponsitory})
      : _userReponsitory = userReponsitory,
        super(const SetupProfileState(status: SetupStatus.initial));

  void saveUserProfile(UserApp user) async {
    await _userReponsitory.updateUser(user);
    if (user != null) {
      emit(state.copyWith(status: SetupStatus.profileUpdateComplete));
    }
  }
}

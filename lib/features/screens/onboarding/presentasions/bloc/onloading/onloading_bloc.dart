import 'package:blogapp/entities/models/user_model.dart';
import 'package:blogapp/services/firebase/firestore_reponsitory/user/user_reponsitory.dart';
import 'package:blogapp/services/firebase/storage/storage_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../export_bloc.dart';

part 'onloading_event.dart';
part 'onloading_state.dart';

class OnloadingBloc extends Bloc<OnloadingEvent, OnloadingState> {
  final StorageRepository _storageRepository;
  final UserReponsitory _userReponsitory;
  OnloadingBloc(
      {required StorageRepository storageRepository,
      required UserReponsitory userReponsitory})
      : _storageRepository = storageRepository,
        _userReponsitory = userReponsitory,
        super(Onloading()) {
    on<StartOnloading>(_onStartloading);
    on<UpdateUser>(_onUpdateUser);
    on<UpdateUserImages>(_onUpdateUserImages);
    on<UpdateUserImageAvatar>(_onUpdateUserImageAvatar);
  }

  void _onStartloading(
      StartOnloading event, Emitter<OnloadingState> emit) async {
    await _userReponsitory.createUser(event.user);
    emit(Onloaded(user: event.user));
  }

  void _onUpdateUser(UpdateUser event, Emitter<OnloadingState> emit) {
    if (state is Onloaded) {
      _userReponsitory.updateUser(event.user);
      emit(Onloaded(user: event.user));
    }
  }

  void _onUpdateUserImages(
      UpdateUserImages event, Emitter<OnloadingState> emit) async {
    if (state is Onloaded) {
      UserApp user = (state as Onloaded).user;
      await _storageRepository.uploadImage(user, event.image);
      _userReponsitory.getUser(user.id!).listen((user) {
        add(UpdateUser(user: user));
      });
    }
  }

  void _onUpdateUserImageAvatar(
      UpdateUserImageAvatar event, Emitter<OnloadingState> emit) async {
    if (state is Onloaded) {
      UserApp user = (state as Onloaded).user;
      await _storageRepository.uploadImageAvatar(user, event.image);
      _userReponsitory.getUser(user.id!).listen((user) {
        add(UpdateUser(user: user));
      });
    }
  }
}

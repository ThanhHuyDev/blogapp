import 'dart:async';
import 'package:equatable/equatable.dart';

import '../../../../../../services/firebase/firebase_reponsitory/user/user_reponsitory.dart';
import '../export_bloc.dart';

part 'image_avatar_event.dart';
part 'image_avatar_state.dart';

class ImageAvatarBloc extends Bloc<ImageAvatarEvent, ImageAvatarState> {
  final UserReponsitory _userReponsitory;
  StreamSubscription? _userSubscription;
  ImageAvatarBloc({required UserReponsitory userReponsitory})
      : _userReponsitory = userReponsitory,
        super(ImageAvatarLoading()) {
    on<UpdateImage>(_onUpdateImage);
    on<LoadImage>(_onLoadImage);
  }

  void _onUpdateImage(UpdateImage event, Emitter<ImageAvatarState> emit) {
    emit(ImageAvatarLoaded(imageAvatar: event.imageAvatar!));
  }

  void _onLoadImage(LoadImage event, Emitter<ImageAvatarState> emit) {
    emit(const ImageAvatarLoaded(imageAvatar: ''));
  }
}

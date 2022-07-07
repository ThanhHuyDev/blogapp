import 'dart:async';

import 'package:blogapp/services/firebase/firebase_reponsitory/user/user_reponsitory.dart';
import 'package:equatable/equatable.dart';

import '../export_bloc.dart';

part 'image_album_event.dart';
part 'image_album_state.dart';

class ImageAlbumBloc extends Bloc<ImageAlbumEvent, ImageAlbumState> {
  final UserReponsitory _userReponsitory;
  StreamSubscription? _userSubscription;
  ImageAlbumBloc({required UserReponsitory userReponsitory})
      : _userReponsitory = userReponsitory,
        super(ImageAlbumLoading()) {
    on<LoadImages>(_onLoadImages);
    on<UpdateImages>(_onUpdateImages);
  }

  void _onLoadImages(LoadImages event, Emitter<ImageAlbumState> emit) {
    _userSubscription?.cancel();
    _userReponsitory.getUserImage().listen((user) {
      add(UpdateImages(user.imageUrl!));
    });
  }

  void _onUpdateImages(UpdateImages event, Emitter<ImageAlbumState> emit) {
    emit(ImageAlbumLoaded(imageUrls: event.imageUrls));
  }
}

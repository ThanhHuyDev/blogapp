part of 'image_avatar_bloc.dart';

abstract class ImageAvatarEvent extends Equatable {
  const ImageAvatarEvent();

  @override
  List<Object> get props => [];
}

class LoadImage extends ImageAvatarEvent {}

class UpdateImage extends ImageAvatarEvent {
  final String? imageAvatar;
  const UpdateImage(this.imageAvatar);

  @override
  List<Object> get props => [imageAvatar!];
}

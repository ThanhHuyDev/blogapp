part of 'image_avatar_bloc.dart';

class ImageAvatarState extends Equatable {
  const ImageAvatarState();

  @override
  List<Object> get props => [];
}

class ImageAvatarLoading extends ImageAvatarState {}

class ImageAvatarLoaded extends ImageAvatarState {
  final String imageAvatar;
  const ImageAvatarLoaded({required this.imageAvatar});

  @override
  List<Object> get props => [imageAvatar];
}

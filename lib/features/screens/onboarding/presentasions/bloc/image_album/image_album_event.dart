part of 'image_album_bloc.dart';

abstract class ImageAlbumEvent extends Equatable {
  const ImageAlbumEvent();

  @override
  List<Object> get props => [];
}

class LoadImages extends ImageAlbumEvent {}

class UpdateImages extends ImageAlbumEvent {
  final List<dynamic> imageUrls;
  const UpdateImages(this.imageUrls);

  @override
  List<Object> get props => [imageUrls];
}

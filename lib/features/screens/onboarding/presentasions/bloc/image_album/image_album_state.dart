part of 'image_album_bloc.dart';

abstract class ImageAlbumState extends Equatable {
  const ImageAlbumState();

  @override
  List<Object> get props => [];
}

class ImageAlbumLoading extends ImageAlbumState {}

class ImageAlbumLoaded extends ImageAlbumState {
  final List<dynamic> imageUrls;
  const ImageAlbumLoaded({this.imageUrls = const []});

  @override
  List<Object> get props => [imageUrls];
}

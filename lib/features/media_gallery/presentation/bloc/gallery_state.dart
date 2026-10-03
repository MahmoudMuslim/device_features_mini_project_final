import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class GalleryState extends Equatable {
  final List<XFile> images;

  const GalleryState({this.images = const []});

  @override
  List<Object?> get props => [images];
}

class GalleryInitialState extends GalleryState {
  const GalleryInitialState() : super(images: const []);
}

class GalleryLoadingState extends GalleryState {
  const GalleryLoadingState({super.images});
}

class GalleryLoadedState extends GalleryState {
  const GalleryLoadedState({required super.images});
}

class GalleryErrorState extends GalleryState {
  final String message;

  const GalleryErrorState({required this.message, super.images});

  @override
  List<Object?> get props => [message, images];
}

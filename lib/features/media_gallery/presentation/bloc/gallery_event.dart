import 'package:equatable/equatable.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object?> get props => [];
}

class PickImagesEvent extends GalleryEvent {}

class ClearImagesEvent extends GalleryEvent {}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/repositories/gallery_repository.dart';
import 'gallery_event.dart';
import 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GalleryRepository repository;

  GalleryBloc({required this.repository}) : super(const GalleryInitialState()) {
    on<PickImagesEvent>(_onPickImages);
    on<ClearImagesEvent>(_onClearImages);
  }

  Future<void> _onPickImages(
    PickImagesEvent event,
    Emitter<GalleryState> emit,
  ) async {
    final currentImages = List<XFile>.from(state.images);
    emit(GalleryLoadingState(images: currentImages));

    try {
      final newImages = await repository.pickMultipleImages();
      if (newImages.isNotEmpty) {
        final updatedImages = [...currentImages, ...newImages];
        emit(GalleryLoadedState(images: updatedImages));
      } else {
        emit(GalleryLoadedState(images: currentImages));
      }
    } catch (e) {
      emit(
        GalleryErrorState(
          message: 'Failed to pick images: ${e.toString()}',
          images: currentImages,
        ),
      );
    }
  }

  void _onClearImages(ClearImagesEvent event, Emitter<GalleryState> emit) {
    emit(const GalleryInitialState());
  }
}

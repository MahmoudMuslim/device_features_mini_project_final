import 'package:image_picker/image_picker.dart';

abstract class GalleryLocalDataSource {
  Future<List<XFile>> pickMultipleImages();
}

class GalleryLocalDataSourceImpl implements GalleryLocalDataSource {
  final ImagePicker imagePicker;

  GalleryLocalDataSourceImpl({required this.imagePicker});

  @override
  Future<List<XFile>> pickMultipleImages() async {
    // Gallery access logic using image_picker package for multi-image selection
    final List<XFile> pickedFiles = await imagePicker.pickMultiImage();
    return pickedFiles;
  }
}

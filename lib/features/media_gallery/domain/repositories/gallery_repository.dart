import 'package:image_picker/image_picker.dart';

abstract class GalleryRepository {
  Future<List<XFile>> pickMultipleImages();
}

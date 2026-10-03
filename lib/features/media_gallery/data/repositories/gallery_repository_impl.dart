import 'package:image_picker/image_picker.dart';

import '../../domain/repositories/gallery_repository.dart';
import '../datasources/gallery_local_datasource.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryLocalDataSource localDataSource;

  GalleryRepositoryImpl({required this.localDataSource});

  @override
  Future<List<XFile>> pickMultipleImages() {
    return localDataSource.pickMultipleImages();
  }
}

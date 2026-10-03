import '../../domain/entities/device_info_entity.dart';
import '../../domain/repositories/device_info_repository.dart';
import '../datasources/device_info_local_datasource.dart';

class DeviceInfoRepositoryImpl implements DeviceInfoRepository {
  final DeviceInfoLocalDataSource localDataSource;

  DeviceInfoRepositoryImpl({required this.localDataSource});

  @override
  Future<DeviceInfoEntity> getDeviceInfo() {
    return localDataSource.getDeviceInfo();
  }
}

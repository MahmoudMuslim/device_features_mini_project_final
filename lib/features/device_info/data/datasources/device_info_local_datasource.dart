import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import '../../domain/entities/device_info_entity.dart';

abstract class DeviceInfoLocalDataSource {
  Future<DeviceInfoEntity> getDeviceInfo();
}

class DeviceInfoLocalDataSourceImpl implements DeviceInfoLocalDataSource {
  final DeviceInfoPlugin deviceInfoPlugin;

  DeviceInfoLocalDataSourceImpl({required this.deviceInfoPlugin});

  @override
  Future<DeviceInfoEntity> getDeviceInfo() async {
    // Device Info retrieval logic utilizing device_info_plus package
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      return DeviceInfoEntity(
        model: androidInfo.model,
        osVersion: 'Android ${androidInfo.version.release}',
        platformName: 'Android',
      );
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      return DeviceInfoEntity(
        model: iosInfo.utsname.machine.isNotEmpty
            ? iosInfo.utsname.machine
            : iosInfo.model,
        osVersion: 'iOS ${iosInfo.systemVersion}',
        platformName: 'iOS',
      );
    } else {
      return const DeviceInfoEntity(
        model: 'Unknown Device',
        osVersion: 'Unknown OS',
        platformName: 'Unknown Platform',
      );
    }
  }
}

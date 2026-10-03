import 'package:equatable/equatable.dart';

/// Represents hardware model name and operating system version.
class DeviceInfoEntity extends Equatable {
  final String model;
  final String osVersion;
  final String platformName;

  const DeviceInfoEntity({
    required this.model,
    required this.osVersion,
    required this.platformName,
  });

  @override
  List<Object?> get props => [model, osVersion, platformName];
}

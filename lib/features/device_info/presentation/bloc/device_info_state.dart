import 'package:equatable/equatable.dart';

import '../../domain/entities/device_info_entity.dart';

abstract class DeviceInfoState extends Equatable {
  const DeviceInfoState();

  @override
  List<Object?> get props => [];
}

class DeviceInfoInitialState extends DeviceInfoState {}

class DeviceInfoLoadingState extends DeviceInfoState {}

class DeviceInfoLoadedState extends DeviceInfoState {
  final DeviceInfoEntity deviceInfo;

  const DeviceInfoLoadedState({required this.deviceInfo});

  @override
  List<Object?> get props => [deviceInfo];
}

class DeviceInfoErrorState extends DeviceInfoState {
  final String message;

  const DeviceInfoErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

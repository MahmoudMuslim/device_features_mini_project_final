import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/device_info_repository.dart';
import 'device_info_event.dart';
import 'device_info_state.dart';

class DeviceInfoBloc extends Bloc<DeviceInfoEvent, DeviceInfoState> {
  final DeviceInfoRepository repository;

  DeviceInfoBloc({required this.repository}) : super(DeviceInfoInitialState()) {
    on<LoadDeviceInfoEvent>(_onLoadDeviceInfo);
  }

  Future<void> _onLoadDeviceInfo(
    LoadDeviceInfoEvent event,
    Emitter<DeviceInfoState> emit,
  ) async {
    emit(DeviceInfoLoadingState());
    try {
      final deviceInfo = await repository.getDeviceInfo();
      emit(DeviceInfoLoadedState(deviceInfo: deviceInfo));
    } catch (e) {
      emit(
        DeviceInfoErrorState(
          message: 'Failed to retrieve device details: ${e.toString()}',
        ),
      );
    }
  }
}

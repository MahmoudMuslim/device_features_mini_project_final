import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/device_info_bloc.dart';
import '../bloc/device_info_state.dart';
import '../widgets/device_info_card_widget.dart';

/// Screen displaying basic hardware model and operating system version in the center.
class DeviceInfoScreen extends StatelessWidget {
  const DeviceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<DeviceInfoBloc, DeviceInfoState>(
            builder: (context, state) {
              if (state is DeviceInfoLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is DeviceInfoLoadedState) {
                return DeviceInfoCardWidget(deviceInfo: state.deviceInfo);
              } else if (state is DeviceInfoErrorState) {
                return Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                );
              }
              return const Text(
                'Press refresh or load to fetch device details.',
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
      ),
    );
  }
}

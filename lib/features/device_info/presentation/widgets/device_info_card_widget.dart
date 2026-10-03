import 'package:flutter/material.dart';

import '../../domain/entities/device_info_entity.dart';

/// Center text widget displaying device model name and OS version as required by Phase 1.
class DeviceInfoCardWidget extends StatelessWidget {
  final DeviceInfoEntity deviceInfo;

  const DeviceInfoCardWidget({super.key, required this.deviceInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.phone_android, size: 64, color: Colors.deepPurple),
            const SizedBox(height: 16),
            Text(
              'Model: ${deviceInfo.model}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'OS Version: ${deviceInfo.osVersion}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            Chip(
              avatar: const Icon(Icons.phonelink, size: 18),
              label: Text(deviceInfo.platformName),
              backgroundColor: Colors.deepPurple.shade50,
            ),
          ],
        ),
      ),
    );
  }
}

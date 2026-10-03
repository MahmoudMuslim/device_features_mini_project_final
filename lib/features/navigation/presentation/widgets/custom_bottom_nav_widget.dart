import 'package:flutter/material.dart';

/// Bottom Navigation Bar allowing tab navigation across feature screens.
class CustomBottomNavWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.perm_device_info_outlined),
          selectedIcon: Icon(Icons.perm_device_info),
          label: 'Device Info',
        ),
        NavigationDestination(
          icon: Icon(Icons.photo_library_outlined),
          selectedIcon: Icon(Icons.photo_library),
          label: 'Gallery',
        ),
        NavigationDestination(
          icon: Icon(Icons.map_outlined),
          selectedIcon: Icon(Icons.map),
          label: 'Map',
        ),
        NavigationDestination(
          icon: Icon(Icons.mic_none_outlined),
          selectedIcon: Icon(Icons.mic),
          label: 'Recorder',
        ),
      ],
    );
  }
}

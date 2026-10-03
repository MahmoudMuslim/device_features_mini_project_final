import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../audio_recorder/presentation/screens/audio_recorder_screen.dart';
import '../../../auth_profile/presentation/bloc/auth_bloc.dart';
import '../../../auth_profile/presentation/bloc/auth_event.dart';
import '../../../auth_profile/presentation/bloc/auth_state.dart';
import '../../../device_info/presentation/screens/device_info_screen.dart';
import '../../../google_maps/presentation/screens/google_map_screen.dart';
import '../../../media_gallery/presentation/screens/gallery_screen.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../widgets/custom_bottom_nav_widget.dart';

/// Main container screen wrapping tabs and handling biometric auth listener for profile access.
class MainScaffoldScreen extends StatefulWidget {
  final int selectedIndex;

  const MainScaffoldScreen({super.key, this.selectedIndex = 0});

  @override
  State<MainScaffoldScreen> createState() => _MainScaffoldScreenState();
}

class _MainScaffoldScreenState extends State<MainScaffoldScreen> {
  late int _currentIndex;

  static const List<String> _titles = [
    'Device Info',
    'Media Gallery',
    'Google Map',
    'Audio Recorder',
  ];

  static const List<Widget> _screens = [
    DeviceInfoScreen(),
    GalleryScreen(),
    GoogleMapScreen(),
    AudioRecorderScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        context.go('/device-info');
        break;
      case 1:
        context.go('/gallery');
        break;
      case 2:
        context.go('/map');
        break;
      case 3:
        context.go('/audio-recorder');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          context.read<AuthBloc>().add(ResetAuthStatusEvent());
          context.push('/profile');
        } else if (state is AuthFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: _currentIndex == 2
            ? null // Google Map screen manages its own AppBar with title "Google Map" as per requirement
            : CustomAppBarWidget(title: _titles[_currentIndex]),
        body: IndexedStack(index: _currentIndex, children: _screens),
        bottomNavigationBar: CustomBottomNavWidget(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
        ),
      ),
    );
  }
}

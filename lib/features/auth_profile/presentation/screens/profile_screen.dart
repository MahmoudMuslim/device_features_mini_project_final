import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_info_tile_widget.dart';

/// Secure profile screen displayed after successful biometric fingerprint authentication.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const ProfileHeaderWidget(
              imageUrl: AppConstants.dummyProfileImage,
              name: AppConstants.dummyProfileName,
            ),
            const SizedBox(height: 32),
            const ProfileInfoTileWidget(
              icon: Icons.person,
              label: 'Full Name',
              value: AppConstants.dummyProfileName,
            ),
            const ProfileInfoTileWidget(
              icon: Icons.email,
              label: 'Email Address',
              value: AppConstants.dummyProfileEmail,
            ),
            const ProfileInfoTileWidget(
              icon: Icons.fingerprint,
              label: 'Security Method',
              value: 'Biometric / Fingerprint Authentication',
            ),
          ],
        ),
      ),
    );
  }
}

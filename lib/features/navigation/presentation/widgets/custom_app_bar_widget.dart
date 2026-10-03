import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth_profile/presentation/bloc/auth_bloc.dart';
import '../../../auth_profile/presentation/bloc/auth_event.dart';

/// App bar containing title and top-right profile icon for biometric access.
class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const CustomAppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle, size: 28),
          tooltip: 'Secure Profile',
          onPressed: () {
            // Trigger biometric fingerprint authentication before profile navigation
            context.read<AuthBloc>().add(AuthenticateUserEvent());
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

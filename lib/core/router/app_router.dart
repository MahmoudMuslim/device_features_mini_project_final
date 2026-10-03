import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth_profile/presentation/screens/profile_screen.dart';
import '../../features/navigation/presentation/screens/main_scaffold_screen.dart';

/// Application router configuration using go_router.
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/device-info',
    routes: [
      GoRoute(
        path: '/device-info',
        builder: (context, state) => const MainScaffoldScreen(selectedIndex: 0),
      ),
      GoRoute(
        path: '/gallery',
        builder: (context, state) => const MainScaffoldScreen(selectedIndex: 1),
      ),
      GoRoute(
        path: '/map',
        builder: (context, state) => const MainScaffoldScreen(selectedIndex: 2),
      ),
      GoRoute(
        path: '/audio-recorder',
        builder: (context, state) => const MainScaffoldScreen(selectedIndex: 3),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}

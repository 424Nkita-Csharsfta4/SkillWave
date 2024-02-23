import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skillwave/course/screens/dashboard_screen.dart';
import 'package:skillwave/screens/profile/profile.dart';
import 'package:skillwave/screens/profile/update_profile/update_profile.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/dashboard',
    routes: [
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: '/update_profile',
        builder: (context, state) => const UpdateProfileScreen(),
      ),
    ],
  );
}

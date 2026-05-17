
import 'package:flutter/material.dart';
import 'package:myapp/features/auth/view/login_screen.dart';
import 'package:myapp/features/challenges/view/home_screen.dart';

// --- 1. Centralized Route Names ---
// We define all route names as static constants to avoid typos
// and to have a single source of truth for our routes.
class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  // Example for a future screen:
  // static const String profile = '/profile';
}

// --- 2. The Router Logic ---
// This class holds the logic for generating routes.
class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      // Example for a future screen:
      // case AppRoutes.profile:
      //   return MaterialPageRoute(builder: (_) => const ProfileScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for \${settings.name}'),
            ),
          ),
        );
    }
  }
}

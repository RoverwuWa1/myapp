import 'package:flutter/material.dart';
import 'package:myapp/features/auth/widgets/google_sign_in_button.dart';
import '../services/auth_service.dart';
import 'dart:developer' as developer;

class AuthButton extends StatefulWidget {
  const AuthButton({super.key});

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  bool _isLoading = false;
  final AuthService _authService = AuthService(); // ✅ fuera del build

  @override
  Widget build(BuildContext context) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return _isLoading
        ? const CircularProgressIndicator()
        : GoogleSignInButton(
            onPressed: () async {
              setState(() => _isLoading = true);

              final user = await _authService.signInWithGoogle();

              if (!mounted) return;

              setState(() => _isLoading = false);

              if (user == null) {
                developer.log('Sign-in failed, showing snackbar.', name: 'AuthButton');
                scaffoldMessenger.showSnackBar(
                  const SnackBar(
                    content: Text('Sign-in failed. Please check your connection or configuration.'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          );
  }
}
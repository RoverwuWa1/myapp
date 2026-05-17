
import 'package:flutter/material.dart';

/// A dumb widget that only handles the UI and appearance of the Google Sign-In button.
/// It receives an `onPressed` callback to make it interactive.
class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Image.asset(
        'assets/images/google_logo.png', // Assuming you have a Google logo in assets
        height: 24.0,
        width: 24.0,
      ),
      label: const Text('Sign in with Google'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.grey[800], backgroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50), // Make button wide
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

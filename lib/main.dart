import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/data/models/navigation.dart';
import 'package:myapp/features/auth/view/auth_gate.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // AuthGate is the entry point, determining the very first screen.
      home: const AuthGate(),

      // AppRouter will handle all subsequent named navigation calls within the app.
      // For example, if you call Navigator.pushNamed(context, AppRoutes.profile)
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

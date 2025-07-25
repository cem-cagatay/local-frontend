import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repositories/auth_repository.dart';
import '../screens/main_scaffold.dart';
import '../screens/signin_screen.dart';

class AuthGate extends StatelessWidget {
  final AuthRepository authRepository;
  const AuthGate({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return const MainScaffold();
        }
        return SignInScreen(authRepository: authRepository);
      },
    );
  }
}
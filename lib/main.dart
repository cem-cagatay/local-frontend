import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'widgets/auth_gate.dart';
import 'repositories/auth_repository.dart';
import 'repositories/firebase_auth_repository.dart';
import 'screens/signin_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/main_scaffold.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(authRepository: FirebaseAuthRepository()));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  const MyApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AuthGate(authRepository: authRepository),
      routes: {
        '/signin': (context) => SignInScreen(authRepository: authRepository),
        '/signup': (context) => SignupScreen(authRepository: authRepository),
        '/main': (context) => const MainScaffold(),
      },
    );
  }
}

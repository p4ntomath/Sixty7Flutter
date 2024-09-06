import 'package:flutter/material.dart';
import 'package:sixty7/auth/firebaseUserSession.dart';
import 'package:sixty7/screens/welcome_screen.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            FirebaseAuthService authService = FirebaseAuthService();
            if (await authService.signOut(context)) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()));
            }
          },
          child: const Text('Log Out'),
        ),
      ),
    );
  }
}

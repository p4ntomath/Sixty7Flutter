// ignore_for_file: unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Firebase core import
import 'package:sixty7/screens/donate_screen.dart';
import 'package:sixty7/auth/userSession.dart';
import 'package:sixty7/screens/addPages/createjobspage.dart';
import 'package:sixty7/screens/addPages/preview.dart';
import 'package:sixty7/screens/addPages/previewCard.dart';
import 'package:sixty7/screens/add_screen.dart';
import 'package:sixty7/screens/components/test.dart';
import 'package:sixty7/screens/forget_password.dart';
import 'package:sixty7/screens/logout.dart';
import 'package:sixty7/screens/main_screen.dart';
import 'package:sixty7/screens/settings_screen.dart';
import 'package:sixty7/screens/signin_screen.dart';
import 'package:sixty7/screens/signup_screen.dart';
import 'package:sixty7/screens/welcome_screen.dart';
import 'firebase_options.dart'; // Import the generated Firebase options

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Firebase initialized successfully!");
  } catch (e) {
    print("Firebase initialization failed: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<bool>? _isLoggedInFuture;

  @override
  void initState() {
    super.initState();
    UserSessionManager session = UserSessionManager();
    _isLoggedInFuture = session.isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: _isLoggedInFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error checking login status'));
          } else if (snapshot.hasData && snapshot.data == true) {
            return const MainScreens();
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}

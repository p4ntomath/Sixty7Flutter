// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sixty7/auth/userSession.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> signIn(String email, String password, BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      DocumentSnapshot<Map<String, dynamic>> userDoc = await _firestore
          .collection('users')
          .doc(uid)
          .get();

      if (userDoc.exists) {
        Map<String, dynamic>? userData = userDoc.data();
        String username = userData?['username'] ?? 'No username';
        String userEmail = userData?['email'] ?? 'No email';
        UserSessionManager session =  UserSessionManager();
        session.saveUserSession(username, userEmail);
        // Dismiss loading dialog
        Navigator.of(context).pop();
        return true;
      } else {
        Navigator.of(context).pop(); // Dismiss loading dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No user document found for this user.'),
          ),
        );
        return false;
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // Dismiss loading dialog
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = 'An error occurred: ${e.message}';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      return false;
    } catch (e) {
      Navigator.of(context).pop(); // Dismiss loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
      return false;
    }
  }

  Future<bool> signUp(String email, String password, String username, BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      await _firestore.collection('users').doc(user?.uid).set({
        'uid': user?.uid,
        'username': username,
        'email': email,
        'createdAt': DateTime.now(),
      });

      UserSessionManager session =  UserSessionManager();
      session.saveUserSession(username, email);
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // Dismiss loading dialog
      String message;
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = 'An error occurred: ${e.message}';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      return false;
    } catch (e) {
      Navigator.of(context).pop(); // Dismiss loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
      return false;
    }
  }

  Future<bool> signOut(BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await _auth.signOut();
      UserSessionManager session =  UserSessionManager();
      session.clearSession();
      Navigator.of(context).pop();
      return true;
    } catch (e) {
      Navigator.of(context).pop(); // Dismiss loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error signing out: $e'),
        ),
      );
      return false;
    }
  }

  Future<bool> resetPassword(String email, BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await _auth.sendPasswordResetEmail(email: email);
      // Dismiss loading dialog
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset email sent.'),
        ),
      );
      return true;
    } catch (e) {
      Navigator.of(context).pop(); // Dismiss loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error sending password reset email: $e'),
        ),
      );
      return false;
    }
  }
}

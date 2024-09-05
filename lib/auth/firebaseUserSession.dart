// ignore_for_file: avoid_print, prefer_final_fields, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<bool> signIn(String email, String password) async {
  try {
    // Sign in with Firebase Authentication
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    String uid = userCredential.user!.uid;


    DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(uid)
        .get();

    if (userDoc.exists) {
      Map<String, dynamic>? userData = userDoc.data();
      String username = userData?['username'] ?? 'No username';
      String userEmail = userData?['email'] ?? 'No email';

      print("Username: $username");
      print("Email: $userEmail");

      return true;
    } else {
      print("No user document found for this user.");
      return false;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    return false;
  } catch (e) {
    print('An error occurred: $e');
    return false;
  }
}


  Future<bool> signUp(String email, String password, String username) async {
    try {
      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      // Save user information in Firestore
      await _firestore.collection('users').doc(user?.uid).set({
        'uid': user?.uid,
        'username': username,
        'email': email,
        'createdAt': DateTime.now(),
      });

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

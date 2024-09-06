// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class UserSessionManager {
  // Keys for SharedPreferences
  static const String _usernameKey = 'username';
  static const String _emailKey = 'email';
  static const String _isLoggedIn = 'isLoggedIn';

  // Save user session (username and email)
  Future<void> saveUserSession(String username, String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
    await prefs.setString(_emailKey, email);
    await prefs.setBool(_isLoggedIn, true);
  }

  // Get username from session
  Future<String?> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedIn) == true ? prefs.getString(_usernameKey) : null;
  }

  // Get email from session
  Future<String?> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedIn) == true ? prefs.getString(_emailKey) : null;
  }

  // Clear user session
  Future<void> clearSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_usernameKey);
    await prefs.remove(_emailKey);
    await prefs.setBool(_isLoggedIn, false);
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_usernameKey) && prefs.containsKey(_emailKey);
  }
}

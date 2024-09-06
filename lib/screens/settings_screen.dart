import 'package:flutter/material.dart';
import 'package:sixty7/screens/about_screen.dart';
import 'package:sixty7/screens/help_screen.dart';
import 'package:sixty7/screens/profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
            color: Colors.white), // Set drawer icon to white
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Settings
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.blue),
                title: const Text('Profile'),
                subtitle: const Text('Manage your profile information'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            // App Appearance
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.palette, color: Colors.blue),
                title: const Text('Appearance'),
                subtitle: const Text('Dark mode, light mode'),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 10),

            // Notifications
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.notifications, color: Colors.blue),
                title: const Text('Notifications'),
                subtitle: const Text('Manage notification settings'),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 10),

            // Privacy and Security
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.security, color: Colors.blue),
                title: const Text('Privacy and Security'),
                subtitle: const Text('Manage privacy and security settings'),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 10),

            // Help and Support
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.help, color: Colors.blue),
                title: const Text('Help and Support'),
                subtitle: const Text('Get help and support'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HelpScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            // About
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.info, color: Colors.blue),
                title: const Text('About'),
                subtitle:
                    const Text('App version, Developers, terms and conditions'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

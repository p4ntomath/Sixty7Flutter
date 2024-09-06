import 'package:flutter/material.dart';
import 'package:sixty7/screens/profile_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Help',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "This should help you navigate around the app",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              HelpCard(
                icon: Icons.event,
                title: 'How to register for an event...',
                onTap: () {
                  // Add your onTap functionality here
                },
              ),
              HelpCard(
                icon: Icons.volunteer_activism,
                title: 'How to donate...',
                onTap: () {
                  // Add your onTap functionality here
                },
              ),
              HelpCard(
                icon: Icons.add_circle_outline,
                title: 'How to add an event...',
                onTap: () {
                  // Add your onTap functionality here
                },
              ),
              HelpCard(
                icon: Icons.edit,
                title: 'How to edit profile...',
                onTap: () {
                  // Add your onTap functionality here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                },
              ),
              HelpCard(
                icon: Icons.bookmark,
                title: 'How to view your bookings...',
                onTap: () {
                  // Add your onTap functionality here
                },
              ),
              HelpCard(
                icon: Icons.notifications,
                title: 'How to manage notifications...',
                onTap: () {
                  // Add your onTap functionality here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HelpCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const HelpCard({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6), // Reduced margin
      elevation: 2, // Lowered elevation to make it appear smaller
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(8.0), // Slightly smaller border radius
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blue,
          size: 24, // Reduced icon size
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 12.0), // Reduced padding
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16, // Reduced font size
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 25, 26, 26),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

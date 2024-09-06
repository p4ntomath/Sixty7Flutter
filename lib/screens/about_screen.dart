import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'About Sixty7',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Sixty7 - A Platform for Change',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 50, 51, 51), // Changed to black
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Sixty7 is an innovative freelancing app that embodies the spirit of Nelson Mandela\'s 67 minutes of community service. Our mission is to connect people who are passionate about making a difference, whether by tutoring, donating food, or volunteering their time to help others.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey, // Changed to blue-grey
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Mission',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Changed to black
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Our mission is to empower individuals to serve their communities and improve lives through collaboration. Sixty7 provides a platform where everyone can contribute and benefit from shared services for free.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey, // Changed to blue-grey
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Vision',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Changed to black
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We envision a world where collaboration and community service come together to create sustainable, positive change in society. Through Sixty7, we aim to build a global network of helpers and change-makers.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey, // Changed to blue-grey
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Purpose',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Changed to black
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Whether you\'re looking to offer a service, like tutoring, or need a hand with a project, Sixty7 provides the tools and connections you need to get started. It\'s a space where generosity and community spirit meet in meaningful ways.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey, // Changed to blue-grey
              ),
            ),
          ],
        ),
      ),
    );
  }
}

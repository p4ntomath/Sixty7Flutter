import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:sixty7/auth/userSession.dart';
import 'package:sixty7/screens/help_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image; // To store the selected image
  late Future<Map<String, String?>> _userDataFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the future to fetch user data
    _userDataFuture = _fetchUserData();
  }

  Future<Map<String, String?>> _fetchUserData() async {
    final session = UserSessionManager();
    final username = await session.getUsername();
    final email = await session.getEmail();
    return {
      'username': username ?? 'John Doe',
      'email': email ?? 'johndoe@example.com',
    };
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture with GestureDetector to change it
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : const AssetImage('assets/images/tutor02.jpg')
                            as ImageProvider, // Default image
                    backgroundColor: Colors.blueGrey[200],
                  ),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Fetch user data and display it
              FutureBuilder<Map<String, String?>>(
                future: _userDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final userData = snapshot.data!;
                    return Column(
                      children: [
                        Text(
                          userData['username'] ?? 'John Doe',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          userData['email'] ?? 'johndoe@example.com',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Text('No user data');
                  }
                },
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 20),

              // Edit Profile Button
              ElevatedButton.icon(
                onPressed: () {
                  // Add your edit profile functionality here
                },
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),

              const SizedBox(height: 30),

              // Profile Options
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                child: ListTile(
                  leading: const Icon(Icons.event_available, color: Colors.blue),
                  title: const Text('Registered Events'),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
                  onTap: () {},
                ),
              ),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                child: ListTile(
                  leading:
                      const Icon(Icons.volunteer_activism, color: Colors.blue),
                  title: const Text('My Donations'),
                  trailing:
                      const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black),
                  onTap: () {},
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                child: ListTile(
                  leading: const Icon(Icons.add, color: Colors.blue),
                  title: const Text('Subscribe'),
                  trailing:
                      const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black),
                  onTap: () {},
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                child: ListTile(
                  leading: const Icon(Icons.help, color: Colors.blue),
                  title: const Text('Help and Support'),
                  trailing:
                      const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HelpScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

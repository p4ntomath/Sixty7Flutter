import 'package:flutter/material.dart';
import 'dart:io'; // Import dart:io for File
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart'; // Import for handling file data

class Preview extends StatelessWidget {
  final String name;
  final String description;
  final String location;
  final String contact;
  final Uint8List? imageData;
  final XFile? imageFile;

  const Preview({
    required this.name,
    required this.description,
    required this.location,
    required this.contact,
    this.imageData,
    this.imageFile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Preview',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Check if imageData or imageFile is provided
                        if (imageData != null)
                          Image.memory(
                            imageData!,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        else if (imageFile != null)
                          Image.file(
                            File(imageFile!.path),
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        else
                          Image.asset(
                            'assets/images/noImage1.jpg', // Use forward slashes in asset path
                          ),
                        const SizedBox(height: 16),
                        Text(
                          'Name: $name',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Description: $description'),
                        const SizedBox(height: 8),
                        Text('Location: $location'),
                        const SizedBox(height: 8),
                        Text('Contact: $contact'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Confirm Button at the bottom
                ElevatedButton(
                  onPressed: () {
                    // Handle confirmation action
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Service Confirmed!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.blue, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

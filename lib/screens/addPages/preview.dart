// ignore_for_file: use_super_parameters, library_private_types_in_public_api, use_build_context_synchronously, empty_statements, unused_import

import 'package:flutter/material.dart';
import 'dart:io'; // Import dart:io for File
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart'; // Import for handling file data
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sixty7/screens/addPages/Service.dart';
import 'package:sixty7/screens/addPages/firebaseStorage.dart';
import 'package:sixty7/screens/main_screen.dart'; // Import your FirebaseStorageService

class Preview extends StatefulWidget {
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
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  final FirebaseStorageService _firebaseStorageService = FirebaseStorageService();

  Future<void> _handleConfirm() async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    String? imageUrl;

    try {
      // Upload image to Firebase Storage
      if (widget.imageFile != null) {
        final filePath = 'service_images/${DateTime.now().millisecondsSinceEpoch}_${widget.imageFile!.name}';
        imageUrl = await _firebaseStorageService.uploadImage(widget.imageFile!, filePath, context);
      } else if (widget.imageData != null) {
        // Handle the Uint8List case if needed
        // For simplicity, I'm assuming it's handled the same way as file upload
        final filePath = 'service_images/${DateTime.now().millisecondsSinceEpoch}_image';
        final tempFile = File('${Directory.systemTemp.path}/temp_image');
        await tempFile.writeAsBytes(widget.imageData!);
        imageUrl = await _firebaseStorageService.uploadImage(XFile(tempFile.path), filePath, context);
      } else {
        // Use default image URL if no image is provided
        imageUrl = 'https://firebasestorage.googleapis.com/v0/b/sixty7-afa11.appspot.com/o/noimage1.jpg?alt=media&token=6c833611-9e77-47df-bb2f-60f03a3356f9';
      }

      // Add service to Firestore
      if (imageUrl != null) {
        final service = Service(
          applied: 0, // or any other default value
          name: widget.name,
          location: widget.location,
          description: widget.description,
          imageUrl: imageUrl,
          contact: widget.contact,
        );

        if(await service.addToFirestore(context)){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Service added successfully')),
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreens()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to add service')),
          );
        };
      } else {
        throw Exception('Image URL is null');
      }
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      Navigator.of(context).pop(); // Dismiss loading dialog
    }
  }

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
                        if (widget.imageData != null)
                          Image.memory(
                            widget.imageData!,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        else if (widget.imageFile != null)
                          Image.file(
                            File(widget.imageFile!.path),
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        else
                          Image.asset(
                            'assets/images/noImage1.jpg',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        const SizedBox(height: 16),
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Description: ${widget.description}'),
                        const SizedBox(height: 8),
                        Text('Location: ${widget.location}'),
                        const SizedBox(height: 8),
                        Text('Contact: ${widget.contact}'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Confirm Button at the bottom
                ElevatedButton(
                  onPressed: _handleConfirm,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50), // Adjust the minimum width and height here
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

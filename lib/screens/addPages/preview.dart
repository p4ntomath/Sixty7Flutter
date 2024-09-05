// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'dart:io'; // Import dart:io for File
import 'dart:typed_data'; // Import for Uint8List
import 'package:image_picker/image_picker.dart'; // Import for handling file data
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sixty7/screens/addPages/Service.dart';
import 'package:sixty7/screens/addPages/firebaseStorage.dart';
import 'package:sixty7/screens/main_screen.dart'; // Import your main screen
import 'package:sixty7/screens/addPages/PreviewCard.dart'; // Import the PreviewCard widget

class Preview extends StatefulWidget {
  final String name;
  final String description;
  final String location;
  final String contact;
  final String type; // New field for service type
  final String date; // New field for date
  final String time; // New field for time
  final Uint8List? imageData;
  final XFile? imageFile;

  const Preview({
    required this.name,
    required this.description,
    required this.location,
    required this.contact,
    required this.type, // Make 'type' required
    required this.date, // Make 'date' required
    required this.time, // Make 'time' required
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
      final filePath = 'service_images/${DateTime.now().millisecondsSinceEpoch}_${widget.imageFile?.name ?? "image"}';

      if (widget.imageFile != null) {
        imageUrl = await _firebaseStorageService.uploadImage(widget.imageFile!, filePath, context);
      } else if (widget.imageData != null) {
        imageUrl = await _firebaseStorageService.uploadImage(widget.imageData!, filePath, context);
      } else {
        // Use default image URL if no image is provided
        imageUrl = 'https://firebasestorage.googleapis.com/v0/b/sixty7-afa11.appspot.com/o/noimage1.jpg?alt=media&token=6c833611-9e77-47df-bb2f-60f03a3356f9';
      }

      if (imageUrl != null) {
        final service = Service(
          applied: 0, // Default value for 'applied'
          name: widget.name,
          location: widget.location,
          description: widget.description,
          imageUrl: imageUrl,
          contact: widget.contact,
          type: widget.type, // Pass 'type'
          date: widget.date, // Pass 'date'
          time: widget.time, // Pass 'time'
        );

        if (await service.addToFirestore(context)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Service added successfully')),
          );
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreens()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to add service')),
          );
        }
      } else {
        throw Exception('Image URL is null');
      }
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error (upload): $e')),
      );
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
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: PreviewCard(
              title: widget.name,
              description: widget.description,
              time: widget.time,
              date: widget.date,
              imageData: widget.imageData,
              imageFile: widget.imageFile,
              type: widget.type,
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleConfirm,
        child: const Icon(Icons.check),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io'; // Import dart:io for File
import 'dart:typed_data'; // Import for Uint8List
import 'package:image_picker/image_picker.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload image to Firebase Storage and return its URL
  Future<String?> uploadImage(dynamic image, String filePath, BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // Create a reference to the file location in Firebase Storage
      Reference ref = _storage.ref().child(filePath);

      UploadTask uploadTask;
      if (image is XFile) {
        // Handle XFile upload
        final contentType = 'image/${_getFileExtension(image.path)}';
        uploadTask = ref.putFile(File(image.path), SettableMetadata(contentType: contentType));
      } else if (image is Uint8List) {
        // Handle Uint8List upload
        uploadTask = ref.putData(image, SettableMetadata(contentType: 'image/jpeg')); // Assuming JPEG for Uint8List
      } else {
        throw Exception('Unsupported image type');
      }

      // Monitor the upload progress (optional)
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        print('Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
      });

      // Wait for the upload to complete
      await uploadTask;

      // Get the download URL
      String downloadURL = await ref.getDownloadURL();

      // Dismiss loading dialog
      Navigator.of(context).pop();

      // Return the download URL
      return downloadURL;
    } catch (e) {
      Navigator.of(context).pop(); // Dismiss loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error uploading image: $e'),
        ),
      );
      print('Upload error: $e'); // Log the error for debugging
      return null;
    }
  }

  // Utility function to get file extension from file path
  String _getFileExtension(String path) {
    final extension = path.split('.').last;
    // Validate if extension is recognized as image
    if (['jpg', 'jpeg', 'png', 'gif'].contains(extension.toLowerCase())) {
      return extension.toLowerCase();
    } else {
      return 'jpeg'; // Default to 'jpeg' if extension is not recognized
    }
  }
}

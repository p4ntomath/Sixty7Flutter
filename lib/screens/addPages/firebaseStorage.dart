import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io'; // Import dart:io for File
import 'package:image_picker/image_picker.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload image to Firebase Storage and return its URL
  Future<String?> uploadImage(XFile imageFile, String filePath, BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      // Create a reference to the file location in Firebase Storage
      Reference ref = _storage.ref().child(filePath);

      // Upload the file
      UploadTask uploadTask = ref.putFile(File(imageFile.path));
      // Wait for the upload to complete
      await uploadTask.whenComplete(() => null);

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
      return null;
    }
  }
}

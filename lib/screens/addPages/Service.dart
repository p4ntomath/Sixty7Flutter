// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Service {
  int applied; // Represents the number of applications or similar metric
  String name; // Name of the service
  String location; // Location where the service is offered
  String description; // Description of the service
  String imageUrl; // URL of the service's image
  String contact; // Contact information for the service
  String type; // Type of the service
  String date; // Date of the service
  String time; // Time of the service

  // Constructor with required fields
  Service({
    required this.applied,
    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.contact,
    required this.type,
    required this.date,
    required this.time,
  });

  // Method to convert Service object to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'applied': applied,
      'name': name,
      'location': location,
      'description': description,
      'imageUrl': imageUrl,
      'contact': contact,
      'type': type,
      'date': date,
      'time': time,
    };
  }

  // Factory method to create a Service object from a map
  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      applied: map['applied'],
      name: map['name'],
      location: map['location'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      contact: map['contact'],
      type: map['type'],
      date: map['date'],
      time: map['time'],
    );
  }

  // Method to add a Service object to Firestore with a unique ID
  Future<bool> addToFirestore(BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // Reference to the 'services' collection in Firestore
      CollectionReference services = FirebaseFirestore.instance.collection('services');

      // Add the Service data to the collection with auto-generated ID
      DocumentReference docRef = await services.add(this.toMap());

      // Optionally, you can also update the document with its unique ID
      await docRef.update({'id': docRef.id});

      // Dismiss the loading dialog
      Navigator.of(context).pop();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Service added successfully!'),
        ),
      );
      return true;
    } catch (e) {
      Navigator.of(context).pop(); // Dismiss the loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error adding service: $e'),
        ),
      );
      return false;
    }
  }
}

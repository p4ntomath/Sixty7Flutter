// ignore_for_file: unnecessary_this, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Service {
  int applied; // Represents the number of applications or similar metric
  String name; // Name of the service
  String location; // Location where the service is offered
  String description; // Description of the service
  String imageUrl; //  of the service's image
  String contact; // Contact information for the service

  // Constructor to initialize the properties
  Service({
    required this.applied,
    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.contact,
  });

  // Method to convert Service object to a map
  Map<String, dynamic> toMap() {
    return {
      'applied': applied,
      'name': name,
      'location': location,
      'description': description,
      'imageUrl': imageUrl,
      'contact': contact,
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
    );
  }

  // Method to add a Service object to Firestore
  Future<bool> addToFirestore(BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      // Reference to the 'services' collection
      CollectionReference services = FirebaseFirestore.instance.collection('services');

      // Add the Service data to the collection
      await services.add(this.toMap());

      // Dismiss loading dialog
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Service added successfully!'),
        ),
      );
      return true;
    } catch (e) {
      Navigator.of(context).pop(); // Dismiss loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error adding service: $e'),
        ),
      );
      return false;
    }
  }
}

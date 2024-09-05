// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'dart:io'; // Import dart:io for File
import 'dart:typed_data'; // Import for Uint8List
import 'package:image_picker/image_picker.dart'; // Import for handling file data

class PreviewCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String date;
  final String type;
  final Uint8List? imageData;
  final XFile? imageFile;

  const PreviewCard({
    required this.title,
    required this.description,
    required this.time,
    required this.date,
    this.imageData,
    this.imageFile,
    required this.type,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 300),
          child: Card(
            elevation: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Image at the top
                SizedBox(
                  width: double.infinity,
                  child: imageData != null
                      ? Image.memory(
                          imageData!,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : imageFile != null
                          ? Image.file(
                              File(imageFile!.path),
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/noImage1.jpg',
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                ), // Vertical space
                // Title and Description
                ListTile(
                  title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(description),
                ), // Vertical space
                // Row for Time, Date, and Action Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // Time
                      Column(
                        children: <Widget>[
                          Icon(Icons.access_time, size: 16), // Smaller icon size
                          SizedBox(height: 4), // Vertical space
                          Text(
                            time,
                            style: TextStyle(fontSize: 11), // Smaller text size
                          ),
                        ],
                      ),
                      // Date
                      Column(
                        children: <Widget>[
                          Icon(Icons.calendar_today, size: 16), // Smaller icon size
                          SizedBox(height: 4), // Vertical space
                          Text(
                            date,
                            style: TextStyle(fontSize: 11), // Smaller text size
                          ),
                        ],
                      ),
                      // Action Button
                      ElevatedButton(
                        onPressed: () {
                          // Add specific functionality for RSVP or Register
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(type == 'Job' ? 'Register button pressed' : 'RSVP button pressed')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Background color
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Rounded corners
                        ),
                        child: Text(
                          type == 'Job' ? 'Register' : 'RSVP',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
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

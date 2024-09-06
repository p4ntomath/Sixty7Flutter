import 'package:flutter/material.dart';
import 'package:sixty7/screens/addPages/createEventpage.dart';
import 'package:sixty7/screens/addPages/createVolunteeringpage.dart';
import 'package:sixty7/screens/addPages/createjobspage.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Add',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 300, // Max width constraint
              child: Card(
                elevation: 4.0, // Add elevation
                margin: const EdgeInsets.symmetric(vertical: 8.0), // Margin around the card
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10.0),
                  title: Center(
                    child: const Text(
                      'Create Job',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateJob()),
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 300, // Max width constraint
              child: Card(
                elevation: 4.0, // Add elevation
                margin: const EdgeInsets.symmetric(vertical: 8.0), // Margin around the card
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10.0),
                  title: Center(
                    child: const Text(
                      'Add Event',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateEvent()),
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 300, // Max width constraint
              child: Card(
                elevation: 4.0, // Add elevation
                margin: const EdgeInsets.symmetric(vertical: 8.0), // Margin around the card
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10.0),
                  title: Center(
                    child: const Text(
                      'Volunteering Opportunity',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateVolunteering()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeCard extends StatefulWidget {
  final String title;
  final String description;
  final String time;
  final String date;
  final String type; // 'Job' or 'Event'
  final String imageUrl; // URL for the image

  const HomeCard({
    Key? key,
    required this.title,
    required this.description,
    required this.time,
    required this.date,
    required this.type,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
                child: Image.network(
                  widget.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/noImage1.jpg',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ), // Vertical space
              // Title and Description
              ListTile(
                title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(widget.description),
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
                        const Icon(Icons.access_time, size: 16), // Smaller icon size
                        const SizedBox(height: 4), // Vertical space
                        Text(
                          widget.time,
                          style: const TextStyle(fontSize: 11), // Smaller text size
                        ),
                      ],
                    ),
                    // Date
                    Column(
                      children: <Widget>[
                        const Icon(Icons.calendar_today, size: 16), // Smaller icon size
                        const SizedBox(height: 4), // Vertical space
                        Text(
                          widget.date,
                          style: const TextStyle(fontSize: 11), // Smaller text size
                        ),
                      ],
                    ),
                    // Action Button
                    ElevatedButton(
                      onPressed: () {
                        // Add specific functionality for RSVP or Register
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(widget.type == 'Job' ? 'Register button pressed' : 'RSVP button pressed')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Background color
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Rounded corners
                      ),
                      child: Text(
                        (widget.type == 'Job' || widget.type == 'Volunteering' ) ? 'Register' : 'RSVP',
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
    );
  }
}

import 'package:flutter/material.dart';

class PopularCard extends StatelessWidget {
  final String title; // Job title or Event title
  final String location; // Job location or Event location
  final String type; // Type of card ('Job' or 'Event')
  final String imageUrl; // URL for the image

  const PopularCard({
    Key? key,
    required this.title,
    required this.location,
    required this.type, // Default to 'Job' if no type is provided
    required this.imageUrl, // Make imageUrl required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 150, // Fixed width
        maxHeight: 200, // Fixed height
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image section
                  SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 120, // Fixed height for the image
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Placeholder in case of error
                        return Image.asset(
                          'assets/images/noImage1.jpg',
                          width: double.infinity,
                          height: 120,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  // Job details section
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        // Company name
                        const SizedBox(height: 4),
                        // Location
                        Text(
                          location,
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Small indicator section
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: type == 'Job' ? Colors.blue : Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  type == 'Job' ? 'Job' : 'Event',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10, // Smaller font size
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

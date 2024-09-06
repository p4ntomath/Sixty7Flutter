import 'package:flutter/material.dart';
import 'package:sixty7/screens/DataAcess/DataRetrieval';
 // Import your FirestoreService class

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: FirestoreService().fetchServices(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            // Create a list of text widgets from the retrieved data
            var data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var item = data[index];
                return ListTile(
                  title: Text(item['name'] ?? 'No Name'),
                  subtitle: Text(item['description'] ?? 'No Description'),
                  trailing: Text(item['type'] ?? 'No Type'),
                  // Optionally display other fields as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sixty7/screens/DataAcess/DataRetrieval'; // Adjust the import according to your project structure
import 'package:sixty7/screens/components/homeCard.dart';
import 'package:sixty7/screens/components/popularCard.dart';
import 'package:sixty7/screens/register_page.dart'; // Import RegisterPage

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  Future<List<Map<String, dynamic>>> _fetchServices() async {
    try {
      FirestoreService firestoreService = FirestoreService();
      return await firestoreService.fetchServices();
    } catch (e) {
      throw Exception('Failed to load services');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white), // Set drawer icon to white
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchServices(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No services found'));
          } else {
            final services = snapshot.data!;
            final _filteredPopularItems = services.where((service) => service['type'] == 'Job').toList();

            final screenWidth = MediaQuery.of(context).size.width;
            final cardWidth = screenWidth > 600 ? screenWidth / 2 - 20 : screenWidth - 20;

            return SingleChildScrollView(
              child: Column(
                children: [
                  // Search bar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),

                  // Popular section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Popular',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  // Horizontal ListView for popular items
                  SizedBox(
                    height: 280.0, // Fixed height for horizontal list
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                      itemCount: _filteredPopularItems.length,
                      itemBuilder: (context, index) {
                        final item = _filteredPopularItems[index];
                        return GestureDetector(
                          onTap: () => {
                            // TODO: Handle the tap event
                          },
                          child: PopularCard(
                            title: item['name'] ?? 'No Title',
                            location: item['location'] ?? 'No Location',
                            type: item['type'] ?? 'Job',
                            imageUrl: item['imageUrl'] ?? '',
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'More...',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  // Use Wrap for the HomeCard widgets
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Wrap(
                      spacing: 10.0, // Space between the cards horizontally
                      runSpacing: 10.0, // Space between rows
                      children: List.generate(5, (index) {
                        final item = services[index];
                        return SizedBox(
                          width: cardWidth, // Adjust card width based on screen size
                          child: HomeCard(
                            title: item['name'] ?? 'No Title',
                            description: item['description'] ?? 'No Description',
                            time: item['time'] ?? 'No Time',
                            date: item['date'] ?? 'No Date',
                            type: item['type'] ?? 'Job',
                            imageUrl: item['imageUrl'] ?? '',
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

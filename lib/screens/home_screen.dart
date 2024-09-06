import 'package:flutter/material.dart';// Adjust the import according to your project structure
import 'package:sixty7/auth/userSession.dart';
import 'package:sixty7/screens/DataAcess/DataRetrieval';
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
  List<Map<String, dynamic>> _services = [];
  List<Map<String, dynamic>> _filteredServices = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
        _filterServices();
      });
    });
    _fetchServices(); // Fetch services on initialization
  }

  Future<void> _fetchServices() async {
    try {
      FirestoreService firestoreService = FirestoreService();
      final services = await firestoreService.fetchServices();
      setState(() {
        _services = services;
        _filterServices(); // Initialize filtered services based on fetched data
      });
    } catch (e) {
      // Handle error
      // You might want to show an error message here
    }
  }

  void _filterServices() {
    _filteredServices = _services.where((service) {
      final title = (service['name'] ?? '').toLowerCase();
      final description = (service['description'] ?? '').toLowerCase();
      return title.contains(_searchQuery) || description.contains(_searchQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth > 600 ? screenWidth / 2 - 20 : screenWidth - 20;
    
    // No filter for the popular section; show all items
    final popularItems = _services
        .toList()
      ..sort((a, b) => (b['applied'] ?? 0).compareTo(a['applied'] ?? 0));
    
    final topPopularItems = popularItems.take(10).toList();

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
      body: _services.isEmpty
          ? const Center(child: CircularProgressIndicator()) // Show loader if services are not yet fetched
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text("Hello User",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 300),
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
    itemCount: topPopularItems.length,
    itemBuilder: (context, index) {
      final item = topPopularItems[index];
      return GestureDetector(
        onTap: () => {
          // TODO: Handle the tap event
        },
        child: Container(
          width: 200, // Fixed width for each card
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: PopularCard(
            title: item['name'] ?? 'No Title',
            location: item['location'] ?? 'No Location',
            type: item['type'] ?? 'Job',
            imageUrl: item['imageUrl'] ?? '',
          ),
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
                      children: List.generate(_filteredServices.length, (index) {
                        final item = _filteredServices[index];
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
            ),
    );
  }

}

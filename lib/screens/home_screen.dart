import 'package:flutter/material.dart';
import 'package:sixty7/screens/register_page.dart'; // Import RegisterPage
import 'package:sixty7/screens/sample_data.dart'; // Import your data model
import 'carditem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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

  List<CardItem> get _filteredPopularItems {
    return popularItems.where((item) {
      return item.title.toLowerCase().contains(_searchQuery);
    }).toList();
  }

  List<CardItem> get _filteredItems {
    return items.where((item) {
      return item.title.toLowerCase().contains(_searchQuery);
    }).toList();
  }

  void _navigateToRegisterPage(CardItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(
          title: item.title,
          description: item.description,
        ),
      ),
    );
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
      ),
      body: Column(
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
            height: 180.0, // Fixed height for horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              itemCount: _filteredPopularItems.length,
              itemBuilder: (context, index) {
                final item = _filteredPopularItems[index];
                return GestureDetector(
                  onTap: () => _navigateToRegisterPage(item),
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 10.0),
                    child: Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(8.0)),
                              child: Image.asset(
                                item.image, // Image from assets
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                      child: Text('Image not found'));
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center, // Center the title
                            ),
                          ),
                        ],
                      ),
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
          // ListView of items (vertical)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: _filteredItems.length, // Number of items
              itemBuilder: (context, index) {
                final item = _filteredItems[index];
                return GestureDetector(
                  onTap: () => _navigateToRegisterPage(item),
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image section with rounded corners
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(8.0)),
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            child: Image.asset(
                              item.image, // Image from assets
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                    child: Text('Failed to load image'));
                              },
                            ),
                          ),
                        ),
                        // Text section
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center, // Center the title
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.description,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Time: ${item.time}',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              Text(
                                'Place: ${item.place}',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              Text(
                                'Duration: ${item.duration}',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

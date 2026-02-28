import 'package:flutter/material.dart';
import 'product_detail.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  final List<Map<String, String>> searchResults = [
    {
      'image': '1',
      'title': 'Egg Chicken Red',
      'subtitle': '4pcs, Price',
      'price': '\$1.99',
    },
    {
      'image': '2',
      'title': 'Egg Chicken White',
      'subtitle': '180g, Price',
      'price': '\$1.50',
    },
    {
      'image': '3',
      'title': 'Egg Pasta',
      'subtitle': '30gm, Price',
      'price': '\$15.99',
    },
    {
      'image': '4',
      'title': 'Egg Noodles',
      'subtitle': '2L, Price',
      'price': '\$15.99',
    },
    {
      'image': '5',
      'title': 'Mayonnais Eggless',
      'subtitle': '300g, Price',
      'price': '\$4.99',
    },
    {
      'image': '6',
      'title': 'Egg Noodles',
      'subtitle': '200g, Price',
      'price': '\$4.99',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF2F3F2),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Row(
            children: [
              const Icon(Icons.search, color: Color(0xFF7C7C7C), size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search Store',
                    hintStyle: TextStyle(
                      color: Color(0xFFB1B1B1),
                      fontSize: 14,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              if (_searchController.text.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    _searchController.clear();
                    setState(() {});
                  },
                  child: const Icon(Icons.close, color: Color(0xFFB1B1B1), size: 20),
                ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Color(0xFF181725), size: 20),
            onPressed: () {
              Navigator.pushNamed(context, '/filters');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.73),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Search Results Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return _buildSearchCard(
                    context: context,
                    imageNumber: searchResults[index]['image']!,
                    title: searchResults[index]['title']!,
                    subtitle: searchResults[index]['subtitle']!,
                    price: searchResults[index]['price']!,
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF53B175),
        unselectedItemColor: const Color(0xFFB1B1B1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _buildSearchCard({
    required BuildContext context,
    required String imageNumber,
    required String title,
    required String subtitle,
    required String price,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              imageNumber: imageNumber,
              title: title,
              subtitle: subtitle,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        width: 173.32,
        height: 248.51,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            // Image Container
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/searchimages/$imageNumber.png',
                    width: 121.69,
                    height: 121.69,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 121.69,
                        height: 121.69,
                        color: Colors.grey.withOpacity(0.2),
                        child: const Center(
                          child: Icon(Icons.image_not_supported, color: Color(0xFFB1B1B1)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Content Container
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF030303),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Subtitle
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF7C7C7C),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Price and Add Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          color: Color(0xFF030303),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Added $title to basket'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        child: Container(
                          width: 45.67,
                          height: 45.67,
                          decoration: BoxDecoration(
                            color: const Color(0xFF53B175),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'beverages.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      'image': '1',
      'title': 'Fresh Fruits\n& Vegetable',
      'backgroundColor': const Color(0xFFEBF5E8),
      'imageWidth': 111.38,
      'imageHeight': 74.9,
    },
    {
      'image': '2',
      'title': 'Cooking Oil\n& Ghee',
      'backgroundColor': const Color(0xFFFFA352),
      'imageWidth': 93.13,
      'imageHeight': 93.13,
    },
    {
      'image': '3',
      'title': 'Meat & Fish',
      'backgroundColor': const Color(0xFFFCE4EC),
      'imageWidth': 102.13,
      'imageHeight': 72.69,
    },
    {
      'image': '4',
      'title': 'Bakery &\nSnacks',
      'backgroundColor': const Color(0xFFD3B0E040),
      'imageWidth': 95.77,
      'imageHeight': 70.77,
    },
    {
      'image': '5',
      'title': 'Dairy & Eggs',
      'backgroundColor': const Color(0xFFFDE59840),
      'imageWidth': 102.13,
      'imageHeight': 68.82,
    },
    {
      'image': '6',
      'title': 'Beverages',
      'backgroundColor': const Color(0xFFB7DFF540),
      'imageWidth': 103.05,
      'imageHeight': 76.19,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Find Products',
          style: TextStyle(
            color: Color(0xFF030303),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F2),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Color(0xFF7C7C7C), size: 20),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Store',
                          hintStyle: TextStyle(
                            color: Color(0xFFB1B1B1),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Category Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.92,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return _buildCategoryCard(
                    context: context,
                    imageNumber: categories[index]['image']!,
                    title: categories[index]['title']!,
                    backgroundColor: categories[index]['backgroundColor']!,
                    imageWidth: categories[index]['imageWidth']!,
                    imageHeight: categories[index]['imageHeight']!,
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
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
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

  Widget _buildCategoryCard({
    required BuildContext context,
    required String imageNumber,
    required String title,
    required Color backgroundColor,
    required double imageWidth,
    required double imageHeight,
  }) {
    return GestureDetector(
      onTap: () {
        if (imageNumber == '6') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BeveragesScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Viewing $title'),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      child: Container(
        width: 174.5,
        height: 189.11,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Product Image
            Image.asset(
              'assets/images/exploreimages/$imageNumber.png',
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: imageWidth,
                  height: imageHeight,
                  color: Colors.grey.withOpacity(0.2),
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Color(0xFFB1B1B1)),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF030303),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

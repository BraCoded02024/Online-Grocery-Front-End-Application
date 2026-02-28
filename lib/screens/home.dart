import 'package:flutter/material.dart';
import 'product_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with location and search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Color(0xFF7C7C7C), size: 20),
                      const SizedBox(width: 8),
                      const Text(
                        'Dhaka, Banasree',
                        style: TextStyle(
                          color: Color(0xFF7C7C7C),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F3F2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/search');
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Color(0xFF7C7C7C), size: 20),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: TextField(
                              enabled: false,
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
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),

            // Banner (Image 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/homeimages/1.png',
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 150,
                      color: const Color(0xFFF2F3F2),
                      child: const Center(
                        child: Icon(Icons.image_not_supported, color: Color(0xFFB1B1B1)),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Exclusive Offer Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Exclusive Offer',
                    style: TextStyle(
                      color: Color(0xFF030303),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        color: Color(0xFF53B175),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Exclusive Offer Cards (Images 2 & 3)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductCard(
                    context: context,
                    imageNumber: '2',
                    title: 'Organic Bananas',
                    subtitle: '7pcs, Priceg',
                    price: '\$4.99',
                  ),
                  _buildProductCard(
                    context: context,
                    imageNumber: '3',
                    title: 'Red Apple',
                    subtitle: '1kg, Priceg',
                    price: '\$4.99',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Best Selling Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Best Selling',
                    style: TextStyle(
                      color: Color(0xFF030303),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        color: Color(0xFF53B175),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Best Selling Cards (Images 4 & 5)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductCard(
                    context: context,
                    imageNumber: '4',
                    title: 'Bell Pepper Red',
                    subtitle: '1kg, Priceg',
                    price: '\$4.99',
                  ),
                  _buildProductCard(
                    context: context,
                    imageNumber: '5',
                    title: 'Ginger',
                    subtitle: '250g, Priceg',
                    price: '\$4.99',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Groceries Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Groceries',
                    style: TextStyle(
                      color: Color(0xFF030303),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        color: Color(0xFF53B175),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Groceries Category Cards (Images 6 & 7)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryCard(
                    context: context,
                    imageNumber: '6',
                    title: 'Pulses',
                  ),
                  _buildCategoryCard(
                    context: context,
                    imageNumber: '7',
                    title: 'Rice',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Groceries Product Cards (Images 8 & 9)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductCard(
                    context: context,
                    imageNumber: '8',
                    title: 'Beef Bone',
                    subtitle: '1kg, Priceg',
                    price: '\$4.99',
                  ),
                  _buildProductCard(
                    context: context,
                    imageNumber: '9',
                    title: 'Broiler Chicken',
                    subtitle: '1kg, Priceg',
                    price: '\$4.99',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF53B175),
        unselectedItemColor: const Color(0xFFB1B1B1),
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/explore');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/mycart');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/favourite');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/account');
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

  Widget _buildProductCard({
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
        width: 173,
        height: 249,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                'assets/images/homeimages/$imageNumber.png',
                width: 173,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 173,
                    height: 120,
                    color: const Color(0xFFF2F3F2),
                    child: const Center(
                      child: Icon(Icons.image_not_supported, color: Color(0xFFB1B1B1)),
                    ),
                  );
                },
              ),
            ),
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
                        onTap: () {},
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF53B175),
                            borderRadius: BorderRadius.circular(10),
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

  Widget _buildCategoryCard({
    required BuildContext context,
    required String imageNumber,
    required String title,
  }) {
    return Container(
      width: 173,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/homeimages/$imageNumber.png',
              width: 173,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 173,
                  height: 100,
                  color: const Color(0xFFF2F3F2),
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Color(0xFFB1B1B1)),
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.3),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

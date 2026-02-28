import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  // Favourite items
  List<Map<String, dynamic>> favouriteItems = [
    {
      'name': 'Sprite Can',
      'unit': '325ml, Price',
      'price': '\$1.50',
      'image': 'assets/images/favouritesimages/1.png',
    },
    {
      'name': 'Diet Coke',
      'unit': '355ml, Price',
      'price': '\$1.99',
      'image': 'assets/images/favouritesimages/2.png',
    },
    {
      'name': 'Apple & Grape Juice',
      'unit': '2L, Price',
      'price': '\$15.50',
      'image': 'assets/images/favouritesimages/3.png',
    },
    {
      'name': 'Coca Cola Can',
      'unit': '325ml, Price',
      'price': '\$4.99',
      'image': 'assets/images/favouritesimages/4.png',
    },
    {
      'name': 'Pepsi Can',
      'unit': '330ml, Price',
      'price': '\$4.99',
      'image': 'assets/images/favouritesimages/5.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.close, color: Color(0xFF030303), size: 24),
        ),
        title: const Text(
          'Favouruite',
          style: TextStyle(
            color: Color(0xFF030303),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Top Divider Line
                  Container(
                    width: 413.6,
                    height: 1,
                    color: const Color(0xFFE2E2E2),
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                  ),
                  ...favouriteItems.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    return Column(
                      children: [
                        // Favourite Item Card
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.27),
                          child: SizedBox(
                            width: 363.73,
                            height: 80,
                            child: Row(
                              children: [
                                // Product Image
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(item['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Product Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item['name'],
                                        style: const TextStyle(
                                          color: Color(0xFF030303),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item['unit'],
                                        style: const TextStyle(
                                          color: Color(0xFF7C7C7C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Price and Arrow
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item['price'],
                                      style: const TextStyle(
                                        color: Color(0xFF030303),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFFB3B3B3),
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Divider Line
                        if (index < favouriteItems.length - 1)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.2),
                            child: Container(
                              width: 363.6,
                              height: 1,
                              color: const Color(0xFFE2E2E2),
                              margin: const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                      ],
                    );
                  }).toList(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          // Add All To Cart Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            child: SizedBox(
              width: double.infinity,
              height: 67,
              child: ElevatedButton(
                onPressed: () {
                  // Add all to cart
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53B175),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Add All To Cart',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        selectedItemColor: const Color(0xFF53B175),
        unselectedItemColor: const Color(0xFFB1B1B1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
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
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}

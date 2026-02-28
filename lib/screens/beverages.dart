import 'package:flutter/material.dart';
import 'product_detail.dart';

class BeveragesScreen extends StatefulWidget {
  const BeveragesScreen({super.key});

  @override
  State<BeveragesScreen> createState() => _BeveragesScreenState();
}

class _BeveragesScreenState extends State<BeveragesScreen> {
  final List<Map<String, String>> beverages = [
    {
      'image': '1',
      'title': 'Diet Coke',
      'subtitle': '355ml, Price',
      'price': '\$1.99',
    },
    {
      'image': '2',
      'title': 'Sprite Can',
      'subtitle': '325ml, Price',
      'price': '\$1.50',
    },
    {
      'image': '3',
      'title': 'Apple & Grape Juice',
      'subtitle': '2L, Price',
      'price': '\$15.99',
    },
    {
      'image': '4',
      'title': 'Orange Juice',
      'subtitle': '2L, Price',
      'price': '\$15.99',
    },
    {
      'image': '5',
      'title': 'Coca Cola Can',
      'subtitle': '325ml, Price',
      'price': '\$4.99',
    },
    {
      'image': '6',
      'title': 'Pepsi Can',
      'subtitle': '330ml, Price',
      'price': '\$4.99',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF181725), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Beverages',
          style: TextStyle(
            color: Color(0xFF030303),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Color(0xFF181725), size: 20),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Beverages Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemCount: beverages.length,
                itemBuilder: (context, index) {
                  return _buildBeverageCard(
                    context: context,
                    imageNumber: beverages[index]['image']!,
                    title: beverages[index]['title']!,
                    subtitle: beverages[index]['subtitle']!,
                    price: beverages[index]['price']!,
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBeverageCard({
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
                    'assets/images/beveragesimages/$imageNumber.png',
                    width: 44.49,
                    height: 89.36,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 44.49,
                        height: 89.36,
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

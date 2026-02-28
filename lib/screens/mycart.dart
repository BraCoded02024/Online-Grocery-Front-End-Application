import 'package:flutter/material.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  // Cart items with quantity
  Map<String, dynamic> cartItems = {
    'Bell Pepper Red': {
      'quantity': 1,
      'price': 4.99,
      'unit': '1kg, Price',
      'image': 'assets/images/mycartimages/1.png',
    },
    'Egg Chicken Red': {
      'quantity': 1,
      'price': 1.99,
      'unit': '4pcs, Price',
      'image': 'assets/images/mycartimages/2.png',
    },
    'Organic Bananas': {
      'quantity': 1,
      'price': 3.00,
      'unit': '12kg, Price',
      'image': 'assets/images/mycartimages/3.png',
    },
    'Ginger': {
      'quantity': 1,
      'price': 2.99,
      'unit': '250gm, Price',
      'image': 'assets/images/mycartimages/4.png',
    },
  };

  double getTotalPrice() {
    double total = 0;
    cartItems.forEach((key, value) {
      total += value['price'] * value['quantity'];
    });
    return total;
  }

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
          'My Cart',
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
                  ...cartItems.entries.map((entry) {
                    final itemName = entry.key;
                    final itemData = entry.value;
                    return Column(
                      children: [
                        // Cart Item Card
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.27),
                          child: SizedBox(
                            width: 363.73,
                            height: 120,
                            child: Row(
                              children: [
                                // Product Image
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(itemData['image']),
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
                                        itemName,
                                        style: const TextStyle(
                                          color: Color(0xFF030303),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        itemData['unit'],
                                        style: const TextStyle(
                                          color: Color(0xFF7C7C7C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      // Quantity Selector
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (itemData['quantity'] > 1) {
                                                  itemData['quantity']--;
                                                }
                                              });
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: const Color(0xFFE2E2E2),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: const Icon(
                                                Icons.remove,
                                                color: Color(0xFFB3B3B3),
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            '${itemData['quantity']}',
                                            style: const TextStyle(
                                              color: Color(0xFF030303),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                itemData['quantity']++;
                                              });
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: const Color(0xFF53B175),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: Color(0xFF53B175),
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Price and Remove
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          cartItems.remove(itemName);
                                        });
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Color(0xFFB3B3B3),
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      '\$${(itemData['price'] * itemData['quantity']).toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: Color(0xFF030303),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Divider Line
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // Go to Checkout Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            child: SizedBox(
              width: double.infinity,
              height: 67,
              child: ElevatedButton(
                onPressed: () {
                  _showCheckoutBottomSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53B175),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Go to Checkout',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '\$${getTotalPrice().toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
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
            icon: Icon(Icons.favorite_border),
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

  void _showCheckoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.65,
          minChildSize: 0.65,
          maxChildSize: 0.75,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 40),
                        const Text(
                          'Checkout',
                          style: TextStyle(
                            color: Color(0xFF030303),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(Icons.close, color: Color(0xFF030303), size: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          children: [
                            // Delivery Section
                            _buildCheckoutItem(
                              label: 'Delivery',
                              value: 'Select Method',
                              icon: Icons.arrow_forward_ios,
                            ),
                            // Payment Section
                            _buildCheckoutItem(
                              label: 'Pament',
                              value: '',
                              icon: Icons.arrow_forward_ios,
                              hasFlag: true,
                            ),
                            // Promo Code Section
                            _buildCheckoutItem(
                              label: 'Promo Code',
                              value: 'Pick discount',
                              icon: Icons.arrow_forward_ios,
                            ),
                            // Total Cost Section
                            _buildCheckoutItem(
                              label: 'Total Cost',
                              value: '\$${getTotalPrice().toStringAsFixed(2)}',
                              icon: Icons.arrow_forward_ios,
                            ),
                            const SizedBox(height: 20),
                            // Terms and Conditions
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'By placing an order you agree to our\n',
                                    style: TextStyle(
                                      color: Color(0xFF7C7C7C),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Terms ',
                                    style: TextStyle(
                                      color: Color(0xFF030303),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'And ',
                                    style: TextStyle(
                                      color: Color(0xFF7C7C7C),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Conditions',
                                    style: TextStyle(
                                      color: Color(0xFF030303),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 60),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Place Order Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 67,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/orderaccepted');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF53B175),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Place Order',
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
            );
          },
        );
      },
    );
  }

  Widget _buildCheckoutItem({
    required String label,
    required String value,
    required IconData icon,
    bool hasFlag = false,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF7C7C7C),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  if (hasFlag)
                    Container(
                      width: 28,
                      height: 18,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/logincarrots.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  else
                    Text(
                      value,
                      style: const TextStyle(
                        color: Color(0xFF030303),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const SizedBox(width: 12),
                  Icon(icon, color: const Color(0xFFB3B3B3), size: 18),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'verification.dart';

class NumberEntryScreen extends StatefulWidget {
  const NumberEntryScreen({super.key});

  @override
  State<NumberEntryScreen> createState() => _NumberEntryScreenState();
}

class _NumberEntryScreenState extends State<NumberEntryScreen> {
  final TextEditingController _numberController = TextEditingController();

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
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Aesthetic Blobs
          Positioned(
            top: -50,
            right: -50,
            child: _buildBlob(const Color(0xFFFFB273).withOpacity(0.08), 250),
          ),
          Positioned(
            top: 150,
            left: -100,
            child: _buildBlob(const Color(0xFF53B175).withOpacity(0.04), 300),
          ),
          Positioned(
            bottom: -150,
            right: -100,
            child: _buildBlob(const Color(0xFF7047EB).withOpacity(0.06), 400),
          ),
          Positioned(
            bottom: 50,
            left: -50,
            child: _buildBlob(const Color(0xFFFFB273).withOpacity(0.04), 200),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Enter your mobile number',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF181725),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Mobile Number',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFE2E2E2), width: 1),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/baangledash.png',
                          width: 33,
                          height: 23,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          '+880',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 18,
                            color: Color(0xFF181725),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: TextField(
                            controller: _numberController,
                            keyboardType: TextInputType.phone,
                            autofocus: true,
                            style: const TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 18,
                              color: Color(0xFF181725),
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Next Button (Figma spec style)
          Positioned(
            top: 400, // Adjusted to be visible above keyboard
            right: 25,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VerificationScreen()),
                );
              },
              backgroundColor: const Color(0xFF53B175),
              elevation: 0,
              child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlob(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: 250,
            spreadRadius: 60,
          ),
        ],
      ),
    );
  }
}

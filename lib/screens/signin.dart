import 'package:flutter/material.dart';
import 'dart:math' as math;

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC), // Matches Figma background
      body: Stack(
        children: [
          // The "Rectangle Layout" Frame (413.37 x 374.15)
          Positioned(
            top: 0.3,
            left: 0,
            child: SizedBox(
              width: 413.37,
              height: 374.15,
              child: ClipRect(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // The image is shifted and then rotated
                    Positioned(
                      top: -200.84, // Exact Figma offset
                      left: -200.66, // Exact Figma offset
                      child: Transform.rotate(
                        angle: 230.29 * (math.pi / 180),
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/mask.jpg',
                          width: 927.35,
                          height: 618.31,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Main Scrollable Content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 374.45), // Match Frame Height + Offset
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Get your groceries\nwith nectar',
                        style: TextStyle(
                          color: Color(0xFF030303),
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Phone Input
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xFFE2E2E2), width: 1),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/carrotsw.png',
                              width: 30,
                              height: 20,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              '+880',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF030303),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter phone number',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF7C7C7C),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      const Center(
                        child: Text(
                          'Or connect with social media',
                          style: TextStyle(
                            color: Color(0xFF828282),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Google Button
                      _buildSocialButton(
                        text: 'Continue with Google',
                        color: const Color(0xFF5383EC),
                        icon: Icons.g_mobiledata,
                      ),
                      const SizedBox(height: 20),

                      // Facebook Button
                      _buildSocialButton(
                        text: 'Continue with Facebook',
                        color: const Color(0xFF4A66AC),
                        icon: Icons.facebook,
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required String text,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      width: double.infinity,
      height: 67,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(19),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 30,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'signin.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/onboard.jpg',
            fit: BoxFit.cover,
            alignment: const Alignment(0.1, 0.0),
          ),
          
          // Elements Overlay
          Positioned(
            top: 485.26,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Carrot Icon (PNG) - Centered with exact dimensions
                Image.asset(
                  'assets/icons/carrotsw.png',
                  width: 48.47,
                  height: 56.36,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 35),
                
                // Welcome Text
                const Text(
                  'Welcome\nto our store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 10),
                
                // Subtitle
                const Text(
                  'Get your groceries in as fast as one hour',
                  style: TextStyle(
                    color: Color.fromRGBO(252, 252, 252, 0.7),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),
                
                // Get Started Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: double.infinity,
                    height: 67,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF53B175),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'signin.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Aesthetic Blobs (Consistent with Select Location)
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  // Top Carrot Icon
                  Center(
                    child: Image.asset(
                      'assets/images/carrotsignup.png',
                      width: 47,
                      height: 55,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 100),
                  
                  // Header
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF181725),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Enter your credentials to continue',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Username Field
                  _buildTextField(
                    label: 'Username',
                    controller: _usernameController,
                    hintText: 'Afsar Hossen Shuvo',
                  ),
                  const SizedBox(height: 30),

                  // Email Field
                  _buildTextField(
                    label: 'Email',
                    controller: _emailController,
                    hintText: 'imshuvo97@gmail.com',
                    suffixIcon: const Icon(Icons.check, color: Color(0xFF53B175)),
                  ),
                  const SizedBox(height: 30),

                  // Password Field
                  _buildTextField(
                    label: 'Password',
                    controller: _passwordController,
                    hintText: '••••••••',
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: const Color(0xFF7C7C7C),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Terms and Policy text
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14,
                        color: Color(0xFF7C7C7C),
                        height: 1.5,
                      ),
                      children: [
                        const TextSpan(text: 'By continuing you agree to our '),
                        TextSpan(
                          text: 'Terms of Service',
                          style: const TextStyle(color: Color(0xFF53B175)),
                        ),
                        const TextSpan(text: '\nand '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: const TextStyle(color: Color(0xFF53B175)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    height: 67,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Sign Up
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF53B175),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Bottom Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF181725),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignInScreen()),
                          );
                        },
                        child: const Text(
                          'Singin', // Matches Figma's "Singup" typo but for Signin
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF53B175),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
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

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF7C7C7C),
          ),
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          style: const TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 18,
            color: Color(0xFF181725),
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFF181725),
              fontSize: 18,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE2E2E2)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF53B175)),
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

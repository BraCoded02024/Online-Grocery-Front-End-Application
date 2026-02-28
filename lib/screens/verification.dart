import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui';
import 'select_location.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F2), // Slightly darker to make the white blur overlay visible
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF181725)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Top section overlay (Figma spec: Width 414.6, Height 233.1, #FCFCFC99, blur 90px)
          Positioned(
            top: 0,
            left: -0.25,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
                child: Container(
                  width: 414.6,
                  height: 233.1,
                  decoration: BoxDecoration(
                    color: const Color(0x99FCFCFC), // #FCFCFC99
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.01),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Enter your 4-digit code',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      height: 29 / 26,
                      color: Color(0xFF181725),
                      letterSpacing: 0,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(height: 35),
                  const Text(
                    'Code',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _codeController,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    autofocus: true,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontFamily: 'Gilroy-Medium',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF181725),
                      letterSpacing: 8,
                    ),
                    decoration: const InputDecoration(
                      hintText: '- - - -',
                      hintStyle: TextStyle(
                        fontFamily: 'Gilroy-Medium',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        height: 29 / 18,
                        color: Color(0xFFE2E2E2),
                        letterSpacing: 0,
                      ),
                      counterText: '',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF53B175)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Absolute Overlay content for accuracy
          Positioned(
            top: 516.74,
            left: 25,
            child: SizedBox(
              width: 112,
              height: 29,
              child: TextButton(
                onPressed: () {
                  // Resend logic
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                ),
                child: const Text(
                  'Resend Code',
                  style: TextStyle(
                    color: Color(0xFF53B175),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Gilroy',
                  ),
                ),
              ),
            ),
          ),
          
          // Next Button (Figma spec: Top 497.74, Left 322, Width 67, Height 67)
          Positioned(
            top: 497.74,
            left: 322,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => const SelectLocationScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Container(
                width: 67,
                height: 67,
                decoration: const BoxDecoration(
                  color: Color(0xFF53B175),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

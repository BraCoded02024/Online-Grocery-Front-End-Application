import 'package:flutter/material.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  // Dropdown values
  String selectedZone = "Banasree";
  String selectedArea = "Types of your area";

  // Mock data for zones and areas
  final List<String> zones = ["Banasree", "Gulshan", "Dhanmondi", "Uttara"];
  final List<String> areas = ["Types of your area", "Block A", "Block B", "Block C", "Block D"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF181725), size: 18),
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // Image from assets
                    Image.asset(
                      'assets/images/selectlocation.png',
                      width: 224,
                      height: 170,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 40),
                    
                    // Title
                    const Text(
                      'Select Your Location',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF181725),
                      ),
                    ),
                    const SizedBox(height: 15),
                    
                    // Subtitle
                    const Text(
                      'Switch on your location to stay in tune with\nwhat’s happening in your area',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                        color: Color(0xFF7C7C7C),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 80),
                    
                    // Zone Dropdown
                    _buildDropdownSection(
                      label: 'Your Zone',
                      value: selectedZone,
                      items: zones,
                      onChanged: (val) {
                        setState(() {
                          selectedZone = val!;
                        });
                      },
                    ),
                    const SizedBox(height: 30),
                    
                    // Area Dropdown
                    _buildDropdownSection(
                      label: 'Your Area',
                      value: selectedArea,
                      items: areas,
                      isPlaceholder: selectedArea == "Types of your area",
                      onChanged: (val) {
                        setState(() {
                          selectedArea = val!;
                        });
                      },
                    ),
                    const SizedBox(height: 40),
                    
                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      height: 67,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF53B175),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
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
            blurRadius: 250, // Increased from 80
            spreadRadius: 60, // Increased from 20
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownSection({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    bool isPlaceholder = false,
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
        const SizedBox(height: 5),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFE2E2E2), width: 1),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: value,
              icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF7C7C7C)),
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: isPlaceholder ? const Color(0xFFB1B1B1) : const Color(0xFF181725),
              ),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      color: item == "Types of your area" ? const Color(0xFFB1B1B1) : const Color(0xFF181725),
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

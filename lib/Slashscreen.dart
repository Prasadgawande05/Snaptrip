import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snaptrip/Snaptriplogin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // ⏳ Navigate to LoginScreen after 3 seconds
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Ensures children cover the whole screen
        children: [
          // 🖼️ Background image
          Image.asset(
            'assets/images/background.jpeg', // Make sure this path is correct
            fit: BoxFit.cover, // Fill the screen without distortion
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3, // Lighter blur
              sigmaY: 3,
            ),
            child: Container(
              color: Colors.transparent, // Keep this transparent for pure blur
            ),
          ),

          // 🌐 Centered Logo + Tagline
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 📍 App Title (SnapTrip)
              Text(
                'SnapTrip',
                style: GoogleFonts.pacifico(
                  // Use a stylish font
                  textStyle: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // 💬 Tagline
              const Text(
                'The World. In a Snap.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),

              Image.asset(
                'assets/images/snaptrip_logo_animation.gif',
                width: 90,
                height: 90,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

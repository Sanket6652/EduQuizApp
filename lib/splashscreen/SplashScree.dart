import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../screens/ClassScreen/class_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization code or delay if needed
    _loadSplashScreen();
  }
  Future<void> _loadSplashScreen() async {
    // Simulate a delay before navigating to the next screen
    await Future.delayed(const Duration(seconds: 3));
    // Navigate to the next screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ClassListScreen()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // Center the logo or any other content
      child: const Center(
        child: FlutterLogo(
          size: 200,
        ),
      ),
    );
  }
}


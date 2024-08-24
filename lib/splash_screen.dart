import 'package:flutter/material.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:lottie/lottie.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  static const Color _backgroundColor = Color(0xFFFFFFFF);
  static const String _logoImagePath = 'assets/images/logo.png';
  static const String _animationPath = 'assets/animations/animation.json';
  static const Duration _animationDuration = Duration(seconds: 2);
  static const Duration _navigationDelay = Duration(seconds: 3);

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller for the fade animation
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    // Define the fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the animation
    _controller.forward();

    // Navigate to the next screen after a delay
    _navigateToNextScreen();
  }


  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
  }

  // A separate async method for handling the navigation
  Future<void> _navigateToNextScreen() async {
    await Future.delayed(_navigationDelay);
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
            Builder(
              builder: (context) {
                return const MyHomePage(title: '',);
              }
            )), // Ensure this navigates to your next screen
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.end, // Move content towards the bottom
          children: [
            // Fade-in Circle Avatar with your image
            FadeTransition(
              opacity: _fadeAnimation,
              child: const CircleAvatar(
                radius: 95,
                backgroundImage: AssetImage(_logoImagePath), // Your logo image
              ),
            ),
            const SizedBox(height: 10), // Space between logo and animation
            // Lottie Animation
            Lottie.asset(
              _animationPath,
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
            const SizedBox(height: 40), // Space at the bottom
          ],
        ),
      ),
    );
  }
}

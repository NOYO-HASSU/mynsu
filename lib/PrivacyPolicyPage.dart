import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003B6F), // Dark Blue color for AppBar
        title: Text(''),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF003B6F), Color(0xFF1D8B73)], // Dark Blue to Light Green gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2), // Slightly transparent container for a modern look
              borderRadius: BorderRadius.circular(20.0), // More rounded corners for a smoother feel
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2.0, // White border with slight opacity
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: Offset(0, 6), // Enhanced shadow effect for depth
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        // Glowing effect with shadow
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.tealAccent,
                                offset: Offset(0, 0),
                                blurRadius: 12.0,
                              ),
                              Shadow(
                                color: Colors.lightGreenAccent,
                                offset: Offset(0, 0),
                                blurRadius: 25.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '1. Introduction\n\n'
                        'Welcome to our application. We are committed to protecting your personal information and your right to privacy. This Privacy Policy explains how we collect, use, and disclose information about you when you use our app.\n\n'
                        '2. Information We Collect\n\n'
                        'We collect information that you provide to us directly, such as your email address and feedback. We may also collect information about your interactions with our app and usage data.\n\n'
                        '3. How We Use Your Information\n\n'
                        'We use your information to improve our app, respond to your feedback, and communicate with you. We may use your email address to send you updates about our app.\n\n'
                        '4. Sharing Your Information\n\n'
                        'We do not share your personal information with third parties except as necessary to provide and improve our app or as required by law.\n\n'
                        '5. Security\n\n'
                        'We implement reasonable measures to protect your information from unauthorized access, use, or disclosure.\n\n'
                        '6. Your Choices\n\n'
                        'You may update your information or request to delete your account by contacting us at the provided email address.\n\n'
                        '7. Changes to This Privacy Policy\n\n'
                        'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on our app.\n\n'
                        '8. Contact Us\n\n'
                        'If you have any questions about this Privacy Policy, please contact us at ranaawais12363@gmail.com.\n',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // Bold all text
                    ),
                    textAlign: TextAlign.justify, // Justified text alignment
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

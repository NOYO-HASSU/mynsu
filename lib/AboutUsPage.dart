import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'), // Removed the title text
        backgroundColor: Colors.blueGrey[900], // Changed AppBar color to match the theme
        foregroundColor: Colors.white, // Text color for AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey[900]!, Colors.blueGrey[600]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Developer Team
                    _buildSectionTitle('Developer Names'),
                    _buildDescriptionContainer(
                      description: 'Rana Awais, Hassan Anjum, Hussain Tahir\n'
                          'From (IET)\n',
                    ),
                    SizedBox(height: 20),

                    // Author Description
                    _buildSectionTitle('Brief Description'),
                    _buildDescriptionContainer(
                      description: 'We are from the Information Engineering Technology Department, Session 2022. '
                          'Our goal is to provide a user-friendly solution addressing the issues students faced with the absence of a university app and their reluctance to use the LMS.',
                      textAlign: TextAlign.justify, // Justified text alignment
                    ),
                    SizedBox(height: 20),

                    // Contact Information
                    _buildSectionTitle('Contact Information'),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSelectableContactInfo(
                            email: 'info@nsu.edu.pk',
                            phone: '051 9250908',
                            label: 'University Mail',
                          ),
                          _buildSelectableContactInfo(
                            email: 'admission@nsu.edu.pk',
                            phone: '051 9250908',
                            label: 'Admission Mail',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Vision
                    _buildSectionTitle('Vision'),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Our vision is to bridge the gap between the students and their academic needs by providing a comprehensive and user-friendly application. We aim to make student life more manageable and accessible through technology.',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.justify, // Justified text alignment
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildDescriptionContainer({required String description, TextAlign textAlign = TextAlign.left}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        description,
        style: TextStyle(color: Colors.white, fontSize: 16),
        textAlign: textAlign, // Pass textAlign to the Text widget
      ),
    );
  }

  Widget _buildSelectableContactInfo({required String email, required String phone, required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SelectableText(
        '$label\nEmail: $email\nPhone: $phone',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

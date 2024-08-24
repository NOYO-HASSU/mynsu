import 'package:flutter/material.dart';
import 'NotificationSettingsPage.dart';
import 'PrivacyPolicyPage.dart'; // Import the PrivacyPolicyPage
import 'main.dart'; // Import your main.dart file

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF004D40), Color(0xFF00796B)], // Custom Gradient matching the app theme
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white), // Set icon color to white
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_pattern.png'), // Replace with your custom image
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop), // Adds a greenish tint
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Settings Container
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Profile Settings
                          _buildSettingTile(
                            icon: Icons.person,
                            title: 'Profile',
                            onTap: () {
                              // Navigate to Profile Settings Page
                            },
                          ),
                          // Notification Settings
                          _buildSettingTile(
                            icon: Icons.notifications,
                            title: 'Notification Settings',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NotificationSettingsPage()),
                              );
                            },
                          ),
                          // Theme Settings
                          _buildSettingTile(
                            icon: Icons.palette,
                            title: 'Theme',
                            onTap: () {
                              _showThemeDialog(context);
                            },
                          ),
                          // Privacy Policy
                          _buildSettingTile(
                            icon: Icons.privacy_tip,
                            title: 'Privacy Policy',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                              );
                            },
                          ),
                          // Logout
                          _buildSettingTile(
                            icon: Icons.exit_to_app,
                            title: 'Logout',
                            onTap: () {
                              // Implement logout functionality and navigate to main.dart
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => MyApp()), // Adjust to your main widget
                                    (Route<dynamic> route) => false, // Remove all previous routes
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Footer section or any additional content
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  void _showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.brightness_4),
                title: Text('Default Theme'),
                onTap: () {
                  // Handle Default Theme selection
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.brightness_2),
                title: Text('Dark Theme'),
                onTap: () {
                  // Handle Dark Theme selection
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.brightness_7),
                title: Text('Light Theme'),
                onTap: () {
                  // Handle Light Theme selection
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.teal),
            SizedBox(width: 16.0),
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      color: Colors.white.withOpacity(0.8),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Powered by Awais, Hassan, Hussain',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          SizedBox(height: 10),
          Text(
            '© 2024 MyCompany. All rights reserved.',
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
          SizedBox(height: 20),
          // Add additional decorative or informational elements here
        ],
      ),
    );
  }
}

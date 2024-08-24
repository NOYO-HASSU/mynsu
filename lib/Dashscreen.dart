import 'package:flutter/material.dart';
import 'PastPapersScreen.dart';
import 'chatbotscreen.dart';
import 'GPACalculatorScreen.dart'; // Import the GPA Calculator screen
import 'navbar.dart';
import 'dart:io';
import 'cgpa_calculator_screen.dart'; // Import the CGPA Calculator screen
import 'personal_calendar.dart';
class Dashscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        return await _showExitConfirmationDialog(context);
      },
      child: Scaffold(
        drawer: navbar(),
          appBar: AppBar(
            title: Text(
              'Home',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: screenWidth * 0.05, // Slightly smaller size
              ),
            ),
            backgroundColor: Color(0xFF004D40),
            centerTitle: true,
            elevation: 4, // Slightly reduced elevation
            iconTheme: IconThemeData(
              color: Colors.white, // Set icon color to white
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15), // Rounded bottom corners
              ),
            ),
          ),

          body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(screenWidth * 0.02), // Padding for responsiveness
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                      vertical: screenHeight * 0.01),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.1, // Slightly smaller radius
                        backgroundImage:
                        AssetImage('assets/images/profile_placeholder.png'),
                        backgroundColor: Colors.grey[200], // Fallback color
                      ),
                      SizedBox(width: screenWidth * 0.04), // Reduced space
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Student Name',
                            style: TextStyle(
                                fontSize: screenWidth * 0.04, // Slightly smaller size
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333333)),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            'Department',
                            style: TextStyle(
                                fontSize: screenWidth * 0.03, // Slightly smaller size
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF555555)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.015), // Reduced height
                _buildAnnouncementSection(
                  context,
                  title: 'University Announcements',
                  text:
                  'Latest announcements from the university will be displayed here.',
                ),
                SizedBox(height: screenHeight * 0.015), // Reduced height
                _buildSection(
                  context,
                  title: 'Academic Information',
                  items: [
                    _buildDashboardItem(context, 'CGPA Calculator',
                        'assets/images/ccal.png', () {
                          // Navigate to CGPA Calculator
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CGPACalculatorScreen()), // Navigate to CGPA Calculator screen
                          );
                        }),
                    _buildDashboardItem(
                        context, 'GPA Calculator', 'assets/images/cal.png', () {
                      // Navigate to GPA Calculator
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GPACalculatorScreen()), // Navigate to GPA Calculator screen
                      );
                    }),
                    _buildDashboardItem(context, 'Past Papers',
                        'assets/images/research.png', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PastPapersScreen()),


                          );
                        }),
                    _buildDashboardItem(context, 'Academic Calendar',
                        'assets/images/calenders.png', () {
                          // Navigate to Academic Calendar
                        }),
                  ],
                ),
                SizedBox(height: screenHeight * 0.015), // Reduced height
                _buildSection(
                  context,
                  title: 'Campus Resources',
                  items: [
                    _buildDashboardItem(context, 'Campus Map',
                        'assets/images/campus_maps.png', () {
                          // Navigate to Campus Map
                        }),
                    _buildDashboardItem(
                        context, 'Events', 'assets/images/events.png', () {
                      // Navigate to Events
                    }),
                  ],
                ),
                SizedBox(height: screenHeight * 0.015), // Reduced height
                _buildSection(
                  context,
                  title: 'Schedule & Calendar',
                  items: [
                    _buildDashboardItem(context, 'Class Schedule',
                        'assets/images/class.png', () {
                          // Navigate to Class Schedule
                        }),
                    _buildDashboardItem(
                        context,
                        'Personal Calendar',
                        'assets/images/pcalender.png', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PersonalCalendarScreen()),
                      );
                      // Navigate to Personal Calendar
                    }),
                  ],
                ),
                SizedBox(height: screenHeight * 0.015), // Reduced height
                _buildSection(
                  context,
                  title: 'LMS Service',
                  items: [
                    _buildDashboardItem(context, 'Course Materials',
                        'assets/images/view.png', () {
                          // Placeholder for LMS course materials
                        }),
                    _buildDashboardItem(context, 'Check Grades',
                        'assets/images/grading.png', () {
                          // Placeholder for LMS grades
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _navigateToChatbotScreen(context),
          child: Icon(Icons.chat),
          backgroundColor: Color(0xFF004D40),
        ),
      ),
    );
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure you want to exit?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => exit(0),
            child: Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

  void _navigateToChatbotScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatBotScreen()),
    );
  }

  Widget _buildSection(BuildContext context,
      {required String title, required List<Widget> items}) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8), // Reduced margin
      padding: EdgeInsets.all(8), // Reduced padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12), // Slightly smaller radius
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0, // Reduced blur radius
            offset: Offset(0, 3), // Reduced offset
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: screenWidth * 0.05, // Slightly smaller size
                fontWeight: FontWeight.bold,
                color: Color(0xFF004D40)),
          ),
          SizedBox(height: 8),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (screenWidth > 600) ? 3 : 2,
              crossAxisSpacing: 6, // Reduced spacing
              mainAxisSpacing: 6, // Reduced spacing
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return items[index];
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardItem(BuildContext context, String title, String imagePath,
      VoidCallback onTap) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12), // Reduced padding
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF004D40), Color(0xFF00796B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0), // Slightly smaller radius
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0, // Reduced blur radius
              offset: Offset(0, 3), // Reduced offset
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use a flexible container for images
            Flexible(
              child: Image.asset(
                imagePath,
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, size: screenWidth * 0.15); // Fallback icon
                },
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.04, // Slightly smaller size
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnnouncementSection(
      BuildContext context, {
        required String title,
        required String text,
      }) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Color(0xFF004D40)),
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: Color(0xFF555555),
            ),
          ),
        ],
      ),
    );
  }
}

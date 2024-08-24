import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PersonalCalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Calendar'),
        backgroundColor: Color(0xFF004D40),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Background image with light and transparent effect
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/logo.png', // Image path
                fit: BoxFit.contain, // Ensures the image scales down to fit within the screen
                height: 300, // Adjust the height to control how much space the image takes
                color: Colors.white.withOpacity(0.2), // Light and transparent effect
                colorBlendMode: BlendMode.dstATop,
              ),
            ),
          ),
          // Calendar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TableCalendar(
              firstDay: DateTime(DateTime.now().year - 2, 1, 1), // Start from 2 years ago
              lastDay: DateTime(DateTime.now().year + 2, 12, 31), // End 2 years from now
              focusedDay: DateTime.now(),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6), // Slightly transparent header background
                ),
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                defaultTextStyle: TextStyle(
                  color: Colors.black, // Ensure text is visible on the image
                ),
                weekendTextStyle: TextStyle(
                  color: Colors.red, // Highlight weekends
                ),
                outsideDaysVisible: false, // Hide days outside the current month
                todayTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Footer with attractive quote
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.blueGrey.shade100, // Light background color for the footer
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  '“The future depends on what you do today.”',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.teal[800],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

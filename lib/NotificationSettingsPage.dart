import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _notificationsEnabled = false;
  bool _generalAnnouncements = true;
  bool _courseUpdates = true;
  bool _eventReminders = true;
  bool _timetableChanges = true;
  bool _examNotifications = true;
  bool _libraryNotifications = true;
  bool _personalReminders = true;
  bool _feedbackSupport = true;
  bool _profileUpdates = true;
  bool _securityAlerts = true;
  bool _appUpdates = true;

  @override
  void initState() {
    super.initState();
    _checkPermissionStatus();
  }

  Future<void> _checkPermissionStatus() async {
    final status = await Permission.notification.status;
    setState(() {
      _notificationsEnabled = status.isGranted;
    });
  }

  Future<void> _toggleNotificationPermission() async {
    if (_notificationsEnabled) {
      // Notifications are already enabled, so disable them
      await openAppSettings();
    } else {
      // Request notification permission
      final status = await Permission.notification.request();
      setState(() {
        _notificationsEnabled = status.isGranted;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification Settings',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF004D40), Color(0xFF00796B)], // Custom Gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white), // Set icon color to white
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F2F1), Color(0xFFB2DFDB)], // Light green gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Manage Notifications',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal[800]),
              ),
              SizedBox(height: 20),
              SwitchListTile(
                title: Text('Enable Notifications'),
                value: _notificationsEnabled,
                onChanged: (value) async {
                  await _toggleNotificationPermission();
                },
                activeColor: Colors.teal, // Custom color for the switch
              ),
              SizedBox(height: 20),
              if (_notificationsEnabled) ...[
                _buildNotificationSwitch('General Announcements', _generalAnnouncements, (value) {
                  setState(() {
                    _generalAnnouncements = value;
                  });
                }),
                _buildNotificationSwitch('Course Updates', _courseUpdates, (value) {
                  setState(() {
                    _courseUpdates = value;
                  });
                }),
                _buildNotificationSwitch('Event Reminders', _eventReminders, (value) {
                  setState(() {
                    _eventReminders = value;
                  });
                }),
                _buildNotificationSwitch('Timetable Changes', _timetableChanges, (value) {
                  setState(() {
                    _timetableChanges = value;
                  });
                }),
                _buildNotificationSwitch('Exam Notifications', _examNotifications, (value) {
                  setState(() {
                    _examNotifications = value;
                  });
                }),
                _buildNotificationSwitch('Library Notifications', _libraryNotifications, (value) {
                  setState(() {
                    _libraryNotifications = value;
                  });
                }),
                _buildNotificationSwitch('Personal Reminders', _personalReminders, (value) {
                  setState(() {
                    _personalReminders = value;
                  });
                }),
                _buildNotificationSwitch('Feedback and Support', _feedbackSupport, (value) {
                  setState(() {
                    _feedbackSupport = value;
                  });
                }),
                _buildNotificationSwitch('Profile Updates', _profileUpdates, (value) {
                  setState(() {
                    _profileUpdates = value;
                  });
                }),
                _buildNotificationSwitch('Security Alerts', _securityAlerts, (value) {
                  setState(() {
                    _securityAlerts = value;
                  });
                }),
                _buildNotificationSwitch('App Updates', _appUpdates, (value) {
                  setState(() {
                    _appUpdates = value;
                  });
                }),
              ] else ...[
                Text(
                  'Please enable notifications to receive updates.',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationSwitch(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: _notificationsEnabled ? onChanged : null,
      activeColor: Colors.teal, // Custom color for the switch
    );
  }
}

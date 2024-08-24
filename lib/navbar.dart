import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mynsu/Dashscreen.dart';
import 'package:mynsu/feedback_page.dart';
import 'package:mynsu/SettingsPage.dart';
import 'package:mynsu/AboutUsPage.dart';

class navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<navbar> {
  String _currentPage = 'Home';

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    print('Attempting to launch $url');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
        print('Successfully launched $url');
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error launching $url: $e');
    }
  }

  void _navigateTo(String page) {
    setState(() {
      _currentPage = page;
    });

    Widget pageWidget;
    switch (page) {
      case 'Home':
        pageWidget = Dashscreen();
        break;
      case 'About Us':
        pageWidget = AboutUsPage();
        break;
      case 'Settings':
        pageWidget = SettingsPage();
        break;
      case 'Feedback':
        pageWidget = FeedbackPage();
        break;
      default:
        pageWidget = Dashscreen();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pageWidget),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'MY NSU',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            accountEmail: GestureDetector(
              onTap: () {
                _launchURL('https://nsu.edu.pk/');
              },
              child: Text(
                'Tab To Vist The Website',
                style: TextStyle(
                  color: Colors.white70,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 80.0,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/university logo.png',
                  width: 160.0,
                  height: 160.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00796B), Color(0xFF004D40)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          _buildListTile('Home', Icons.home, 'Home'),
          _buildListTile('About Us', Icons.info, 'About Us'),
          _buildListTile('Settings', Icons.settings, 'Settings'),
          _buildListTile('Feedback', Icons.feedback, 'Feedback'),
          ListTile(
            leading: Icon(Icons.share, color: Color(0xFF004D40)),
            title: Text('Share this app', style: TextStyle(color: Color(0xFF004D40))),
            onTap: () => _shareApp(),
          ),
          SizedBox(height: 90),
          Divider(),
          ListTile(
            leading: Icon(Icons.public, color: Color(0xFF004D40)),
            title: Text('Follow us on social media', style: TextStyle(color: Color(0xFF004D40))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: FaIcon(FontAwesomeIcons.instagram, color: Color(0xFF004D40)),
                onPressed: () {
                  print('Instagram button pressed');
                  _launchURL('https://www.instagram.com/nationalskillsuniversity/?hl=en');
                },
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.facebook, color: Color(0xFF004D40)),
                onPressed: () {
                  print('Facebook button pressed');
                  _launchURL('https://www.facebook.com/NSUIslamabad');
                },
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.youtube, color: Color(0xFF004D40)),
                onPressed: () {
                  print('YouTube button pressed');
                  _launchURL('https://www.youtube.com/@nsuislamabad');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  ListTile _buildListTile(String title, IconData icon, String page) {
    bool isActive = _currentPage == page;
    return ListTile(
      leading: Icon(icon, color: isActive ? Colors.teal : Color(0xFF004D40)),
      title: Text(
        title,
        style: TextStyle(color: isActive ? Colors.teal : Color(0xFF004D40)),
      ),
      tileColor: isActive ? Colors.teal.withOpacity(0.1) : null,
      onTap: () => _navigateTo(page),
    );
  }

  void _shareApp() {
    Share.share('Check out this amazing app: [Your App Link]');
  }
}

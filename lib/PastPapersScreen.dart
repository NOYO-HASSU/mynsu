import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(
    home: PastPapersScreen(),
  ));
}

class PastPapersScreen extends StatelessWidget {
  const PastPapersScreen({super.key});

  // Function to open the URL for downloading the file
  void _downloadFile(String url) async {
    Uri uri = Uri.parse(url); // Convert the URL string to a Uri object

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor:
        const Color(0xFF004D40), // Updated color for a fresh look
        centerTitle: true,
        elevation: 10, // Adds a shadow effect
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Past Papers',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF004D40),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildCourseDropdown(
                    context,
                    'Department - IET ',
                    {
                      '1st Semester':
                      'https://drive.google.com/uc?export=download&id=1VU4lie5zSLQeFC3ZoII2SUTeOygbPAhe',
                      '2nd Semester':
                      'https://drive.google.com/uc?export=download&id=1uZku7nbSpC4kE2fnh3wBrq0Wd6Dv7whe',
                      '3rd Semester':
                      'https://drive.google.com/uc?export=download&id=1kZqur0_gng-4fmZDQwVv8gMgX40HNdK-',
                      '4th Semester':
                      'https://drive.google.com/uc?export=download&id=YOUR_FILE_ID_2',
                      '5th Semester':
                      'https://drive.google.com/uc?export=download&id=YOUR_FILE_ID_2',
                      '6th Semester':
                      'https://drive.google.com/uc?export=download&id=YOUR_FILE_ID_2',
                    },
                  ),
                  _buildCourseDropdown(
                    context,
                    'Department - CS',
                    {
                      '1st Semester':
                      'https://drive.google.com/drive/folders/1K8Z-o2PegjKrnmANFnDe0-ZZJ6u2sMOU?usp=drive_link',
                      '2nd Semester':
                      'https://drive.google.com/uc?export=download&id=1K8Z-o2PegjKrnmANFnDe0-ZZJ6u2sMOU',
                      '3rd Semester':
                      'https://drive.google.com/uc?export=download&id=YOUR_FILE_ID_2',
                      '4th Semester':
                      'https://drive.google.com/uc?export=download&id=YOUR_FILE_ID_2',
                      '5th Semester':
                      'https://drive.google.com/uc?export=download&id=YOUR_FILE_ID_2',
                      '6th Semester':
                      'https://drive.google.com/uc?export=download&id=YOUR_FILE_ID_2',
                      '7th Semester':
                      'https://drive.google.com/uc?export=download&id=YOUR_FILE_ID_2',
                      '8th Semester':
                      'https://drive.google.com/uc?export=download&id=YOUR_FILE_ID_2',
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseDropdown(
      BuildContext context, String courseTitle, Map<String, String> papers) {
    return ExpansionTile(
      title: Text(
        courseTitle,
        style: const TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.teal),
      ),
      backgroundColor: Colors.teal.withOpacity(0.1),
      iconColor: Colors.teal,
      children: papers.entries.map((entry) {
        return ListTile(
          title: Text(
            entry.key,
            style: TextStyle(fontSize: 18.0, color: Colors.teal[800]),
          ),
          onTap: () => _downloadFile(entry.value),
          trailing: const Icon(Icons.download, color: Colors.teal),
        );
      }).toList(),
    );
  }
}

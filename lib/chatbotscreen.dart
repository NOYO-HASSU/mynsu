import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map> messages = [];

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return; // Prevent sending empty messages

    _controller.clear();
    setState(() {
      messages.insert(0, {"data": 1, "message": text});
    });

    String response = _getResponse(text);

    setState(() {
      messages.insert(0, {"data": 0, "message": response});
    });
  }

  String _getResponse(String query) {
    String lowerCaseQuery = query.toLowerCase();

    if (lowerCaseQuery.contains("course information")) {
      return "You can find course information on the university website or contact your department.";
    } else if (lowerCaseQuery.contains("faculty contacts")) {
      return "Faculty contact information is available on the university website.";
    } else if (lowerCaseQuery.contains("campus map")) {
      return "The campus map can be accessed through the university's official app.";
    } else if (lowerCaseQuery.contains("library hours")) {
      return "The library is open from 9 AM to 8 PM on weekdays and 10 AM to 6 PM on weekends.";
    } else if (lowerCaseQuery.contains("admissions")) {
      return "For admission inquiries, please visit the admissions office or check the university website.";
    } else if (lowerCaseQuery.contains("fees structure")) {
      return "You can find the fee structure details on the university website or contact the accounts office.";
    } else if (lowerCaseQuery.contains("exam schedule")) {
      return "The exam schedule is available on the university portal under the 'Exams' section.";
    } else if (lowerCaseQuery.contains("hostel information")) {
      return "Hostel information can be obtained from the student services office or the university website.";
    } else if (lowerCaseQuery.contains("scholarships")) {
      return "Information about scholarships is available on the university website or through the financial aid office.";
    } else if (lowerCaseQuery.contains("student clubs")) {
      return "Details about student clubs can be found on the university website or by contacting the student affairs office.";
    } else if (lowerCaseQuery.contains("working hours")) {
      return "University working hours are from 9 AM to 5 PM, Monday to Friday.";
    } else if (lowerCaseQuery.contains("holiday schedule")) {
      return "Holiday schedule is posted on the university website and the notice boards.";
    } else if (lowerCaseQuery.contains("registration deadlines")) {
      return "Registration deadlines are updated on the university website and the academic calendar.";
    } else if (lowerCaseQuery.contains("student health services")) {
      return "Student health services are available at the campus health center.";
    } else if (lowerCaseQuery.contains("transportation services")) {
      return "Transportation services information is available on the university website or by contacting the student services office.";
    } else if (lowerCaseQuery.contains("internship opportunities")) {
      return "Internship opportunities are listed on the university's career services website or through departmental notices.";
    } else if (lowerCaseQuery.contains("exam results")) {
      return "Exam results are available on the university portal under the 'Results' section.";
    } else if (lowerCaseQuery.contains("contact administration")) {
      return "You can contact the university administration through the contact details available on the university website.";
    } else if (lowerCaseQuery.contains("events")) {
      return "University events are announced on the university website and social media pages.";
    } else if (lowerCaseQuery.contains("feedback")) {
      return "Feedback can be provided through the university's official feedback portal or by contacting the student affairs office.";
    } else if (lowerCaseQuery.contains("code of conduct")) {
      return "The university's code of conduct is available on the university website under the 'Policies' section.";
    } else if (lowerCaseQuery.contains("orientation program")) {
      return "Information about orientation programs for new students is available on the university website.";
    } else if (lowerCaseQuery.contains("online resources")) {
      return "Online resources and e-learning materials can be accessed through the university's online learning platform.";
    } else if (lowerCaseQuery.contains("career counseling")) {
      return "Career counseling services are available at the university's career services office.";
    } else if (lowerCaseQuery.contains("academic calendar")) {
      return "The academic calendar is available on the university website.";
    } else if (lowerCaseQuery.contains("library resources")) {
      return "Library resources can be accessed through the university library's website.";
    } else if (lowerCaseQuery.contains("graduation requirements")) {
      return "Graduation requirements, including credit hours and mandatory courses, are detailed on the university website under the 'Academics' section.";
    } else if (lowerCaseQuery.contains("course enrollment")) {
      return "Course enrollment information and deadlines are available on the university's online portal.";
    } else if (lowerCaseQuery.contains("student discounts")) {
      return "Information on student discounts and partnerships is available on the university's website or through the student affairs office.";
    } else if (lowerCaseQuery.contains("study abroad programs")) {
      return "Details on study abroad programs and application procedures can be found on the university's international office webpage.";
    } else if (lowerCaseQuery.contains("academic advising")) {
      return "Academic advising services are available to help you with course selection and academic planning. You can contact your academic advisor for more information.";
    } else if (lowerCaseQuery.contains("IT support")) {
      return "IT support for technical issues and access to university systems is available through the IT department's helpdesk.";
    } else if (lowerCaseQuery.contains("parking information")) {
      return "Parking information and permits are available from the campus security office or the university website.";
    } else if (lowerCaseQuery.contains("library membership")) {
      return "Library membership details and how to apply can be found on the university library's website.";
    } else if (lowerCaseQuery.contains("alumni services")) {
      return "Alumni services and support are available through the alumni association. Visit the university's alumni website for more information.";
    } else if (lowerCaseQuery.contains("mental health resources")) {
      return "Mental health resources and counseling services are available through the campus counseling center.";
    } else if (lowerCaseQuery.contains("language courses")) {
      return "Information on language courses and enrollment is available on the university's academic programs page.";
    } else if (lowerCaseQuery.contains("student housing application")) {
      return "The student housing application process and requirements are available on the student services webpage.";
    } else if (lowerCaseQuery.contains("student jobs")) {
      return "Student job opportunities on campus are listed on the university's career services website or through the student affairs office.";
    } else if (lowerCaseQuery.contains("who is engr afifa zafar")) {
      return "Engr Afifa Zafar is a lecturer at National Skills University Islamabad.";
    } else if (lowerCaseQuery.contains("who developed this nsu app")) {
      return "The developers of this app are Rana Awais, Hassan Anjum, and Hussain Tahir. They created the NSU app and are from the IET department.";
    } else {
      return "Sorry, I don't have an answer for that. Please contact the university administration for more details.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nsu ChatBot'),
        backgroundColor: Color(0xFF004D40),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) => _buildMessage(messages[index]["message"], messages[index]["data"]),
            ),
          ),
          Divider(height: 1.0),
          Container(
            padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: _sendMessage,
                    decoration: InputDecoration.collapsed(hintText: "Type your message..."),
                  ),
                ),
                IconButton(
                  icon: FaIcon(Icons.send), // Changed to 'send' icon for clarity
                  onPressed: () => _sendMessage(_controller.text),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(String message, int data) {
    return ListTile(
      title: Align(
        alignment: data == 1 ? Alignment.topRight : Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: data == 1 ? Colors.greenAccent : Colors.white,
          ),
          padding: EdgeInsets.all(10.0),
          child: Text(message, style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}

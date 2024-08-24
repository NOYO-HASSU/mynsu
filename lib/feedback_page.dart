import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController feedbackController = TextEditingController();
  String feedbackMessage = '';
  bool isSending = false;

  Future<void> sendFeedback() async {
    if (emailController.text.isEmpty || feedbackController.text.isEmpty) {
      setState(() {
        feedbackMessage = 'Please fill out all fields.';
      });
      return;
    }

    final Email email = Email(
      body: feedbackController.text,
      subject: 'User Feedback',
      recipients: ['ra999111222@gmail.com'],
      isHTML: false,
    );

    setState(() {
      isSending = true;
      feedbackMessage = '';
    });

    try {
      await FlutterEmailSender.send(email);
      setState(() {
        emailController.clear();
        feedbackController.clear();
        feedbackMessage = 'Thanks for your feedback!';
        isSending = false;
      });
      Fluttertoast.showToast(
        msg: 'Feedback sent successfully!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } catch (error) {
      setState(() {
        feedbackMessage = 'Failed to send feedback. Please make sure you have an email client installed and try again.';
        isSending = false;
      });
      Fluttertoast.showToast(
        msg: 'No email client found. Please install an email client and try again.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
      print('Error details: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback',
          style: TextStyle(color: Colors.white), // Text color
        ),
        backgroundColor: Color(0xFF004D40),
        iconTheme: IconThemeData(color: Colors.white),// Dark teal for AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F2F1), Color(0xFFB2DFDB)], // Light green gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image Banner with Color Filter to Adjust Yellow
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), // Adjust opacity and color as needed
                    BlendMode.saturation,
                  ),
                  child: Image.asset(
                    'assets/images/feed.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                // 'Your Feedback Matters' text
                Text(
                  'Your Feedback Matters',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF004D40), // Dark teal color
                  ),
                ),
                SizedBox(height: 20),
                // Email TextBox
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                // Feedback TextBox
                TextField(
                  controller: feedbackController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Enter your feedback',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                // Submit Button
                ElevatedButton(
                  onPressed: isSending ? null : sendFeedback,
                  child: isSending
                      ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Color(0xFF004D40), // Button text color
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
                SizedBox(height: 20),
                // Feedback message
                if (feedbackMessage.isNotEmpty)
                  Text(
                    feedbackMessage,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF004D40), // Dark teal color
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

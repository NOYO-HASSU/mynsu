import 'package:flutter/material.dart';
import 'package:mynsu/Dashscreen.dart';
import 'package:mynsu/splash_screen.dart'; // Ensure this imports the correct SplashScreen widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nsu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.teal,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true; // Toggle password visibility

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Ensures that the layout adjusts when the keyboard is open
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/images/bgd.png', // Background image
                // Adjust image alignment and size if needed
                alignment: Alignment.center,
              ),
            ),
          ),
          // Centered Login Container
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                constraints: BoxConstraints(
                  maxWidth: 350, // Slightly reduced width
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9), // Slightly transparent white background
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/university logo.png', // Updated logo asset path
                      width: 160, // Adjusted size for responsiveness
                      height: 160, // Adjusted size for responsiveness
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Welcome To Login',
                      style: TextStyle(
                        fontSize: 22, // Adjusted size for better readability
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF004D40),
                      ),
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                  labelText: 'Username',
                                  hintText: 'Enter your username',
                                  prefixIcon: Icon(Icons.person_rounded, color: Colors.teal), // Updated icon
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Color(0xFF004D40), width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Color(0xFF004D40), width: 1.5),
                                  ),
                                ),
                                validator: (value) {
                                  return value!.isEmpty ? 'Please enter your username' : null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                obscureText: _obscureText, // Toggle visibility based on state
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  prefixIcon: Icon(Icons.lock_open_rounded, color: Colors.teal), // Updated icon
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                                      color: Colors.teal,
                                    ),
                                    onPressed: _togglePasswordVisibility, // Toggle visibility
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Color(0xFF004D40), width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Color(0xFF004D40), width: 1.5),
                                  ),
                                ),
                                validator: (value) {
                                  return value!.isEmpty ? 'Please enter your password' : null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ?? false) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Dashscreen()),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF004D40), // Dark teal color
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30), // Same shape as text fields
                                    ),
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white), // White text color
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

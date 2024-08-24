import 'dart:math'; // Import for random number generation
import 'package:flutter/material.dart';

class CGPACalculatorScreen extends StatefulWidget {
  @override
  _CGPACalculatorScreenState createState() => _CGPACalculatorScreenState();
}

class _CGPACalculatorScreenState extends State<CGPACalculatorScreen> {
  final List<Semester> _semesters = List.generate(2, (index) => Semester(index: index + 1));

  double _currentCGPA = 0.0;
  String _motivationalQuote = '';

  // List of motivational quotes
  final List<String> _quotes = [
    "Believe you can and you're halfway there.",
    "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "The only limit to our realization of tomorrow is our doubts of today.",
    "Hardships often prepare ordinary people for an extraordinary destiny.",
    "The future belongs to those who believe in the beauty of their dreams.",
    "It does not matter how slowly you go as long as you do not stop.",
    "Dream big and dare to fail.",
    "Act as if what you do makes a difference. It does.",
    "You are never too old to set another goal or to dream a new dream.",
    "Success usually comes to those who are too busy to be looking for it.",
    "One day your life will flash before your eyes. Make sure it is worth watching. - Mooie",
    "Skill Matters, don't worry it's just a decimal point. I know you can do anything at the end. Skill Matters."
  ];

  void _addSemester() {
    setState(() {
      _semesters.add(Semester(index: _semesters.length + 1));
    });
  }

  void _removeSemester(int index) {
    setState(() {
      if (_semesters.length > 2) { // Ensure at least 2 semesters
        _semesters.removeAt(index);
        // Update indices for all remaining semesters
        for (int i = 0; i < _semesters.length; i++) {
          _semesters[i].index = i + 1;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You must have at least two semesters.'),
          ),
        );
      }
    });
  }

  void _calculateCGPA() {
    double totalPoints = 0.0;
    double totalCredits = 0.0;
    bool hasEmptyGPA = false;

    for (var semester in _semesters) {
      if (semester.gpa == null) {
        hasEmptyGPA = true;
      } else {
        const int defaultCredits = 3; // Default credit hours for each semester
        totalPoints += semester.gpa! * defaultCredits;
        totalCredits += defaultCredits;
      }
    }

    if (hasEmptyGPA) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter GPA for all semesters.'),
        ),
      );
    } else {
      setState(() {
        _currentCGPA = totalCredits > 0 ? totalPoints / totalCredits : 0.0;
        _currentCGPA = double.parse(_currentCGPA.toStringAsFixed(3)); // Ensure rounding to 3 decimal places

        // Choose a specific quote if CGPA is below 2.0
        if (_currentCGPA < 2.5) {
          _motivationalQuote = "Don't worry it's just a decimal point. I know you can do anything, at the end. Skills Matter.\n   Regards:  'Rana Awais'";
        } else {
          // Select a random quote
          final random = Random();
          _motivationalQuote = _quotes[random.nextInt(_quotes.length)];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CGPA Calculator'),
        backgroundColor: Color(0xFF004D40),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _semesters.length,
                itemBuilder: (context, index) {
                  return _buildSemesterForm(index);
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addSemester,
              child: Text('Add Another Semester'),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF004D40)),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateCGPA,
              child: Text('Calculate CGPA'),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF004D40)),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: _currentCGPA, end: _currentCGPA),
              duration: Duration(seconds: 1),
              builder: (context, value, child) {
                return AnimatedContainer(
                  duration: Duration(seconds: 1),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Your CGPA',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[800],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        value.toStringAsFixed(3), // Ensure rounding to 3 decimal places
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[600],
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        _motivationalQuote,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[700],
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSemesterForm(int index) {
    final semester = _semesters[index];
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Semester ${semester.index}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    initialValue: semester.gpa?.toString() ?? '',
                    decoration: InputDecoration(
                      labelText: 'GPA',
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      semester.gpa = double.tryParse(value);
                    },
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _removeSemester(index),
            ),
          ],
        ),
      ),
    );
  }
}

class Semester {
  double? gpa;
  int index;

  Semester({required this.index});
}

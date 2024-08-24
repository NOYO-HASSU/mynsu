import 'package:flutter/material.dart';

class GPACalculatorScreen extends StatefulWidget {
  @override
  _GPACalculatorScreenState createState() => _GPACalculatorScreenState();
}

class _GPACalculatorScreenState extends State<GPACalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<Course> _courses = List.generate(4, (_) => Course());

  final List<String> _grades = [
    'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'F'
  ];

  double _currentGPA = 0.0;

  void _addCourse() {
    setState(() {
      _courses.add(Course());
    });
  }

  void _removeCourse(int index) {
    setState(() {
      if (_courses.length > 1) {
        _courses.removeAt(index);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You must have at least one course.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  void _calculateGPA() {
    if (_validateCourses()) {
      double totalPoints = 0.0;
      double totalCredits = 0.0;

      for (var course in _courses) {
        totalPoints += _gradeToGPA(course.grade!) * course.credits!;
        totalCredits += course.credits!;
      }

      setState(() {
        _currentGPA = totalCredits > 0 ? totalPoints / totalCredits : 0.0;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill out all fields for each course.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  bool _validateCourses() {
    for (var course in _courses) {
      if (course.name == null || course.name!.isEmpty ||
          course.credits == null || course.grade == null) {
        return false;
      }
    }
    return true;
  }

  double _gradeToGPA(String grade) {
    switch (grade) {
      case 'A': return 4.00;
      case 'A-': return 3.70;
      case 'B+': return 3.30;
      case 'B': return 3.00;
      case 'B-': return 2.70;
      case 'C+': return 2.30;
      case 'C': return 2.00;
      case 'C-': return 1.70;
      case 'D+': return 1.30;
      case 'D': return 1.00;
      case 'F': return 0.00;
      default: return 0.00;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPA Calculator'),
        backgroundColor: Color(0xFF004D40),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _courses.length,
                itemBuilder: (context, index) {
                  return _buildCourseForm(index);
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addCourse,
              child: Text('Add Another Course'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF004D40)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateGPA,
              child: Text('Calculate GPA'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF004D40)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: _currentGPA, end: _currentGPA),
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
                        'Your GPA',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[800],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        value.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[600],
                        ),
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

  Widget _buildCourseForm(int index) {
    final course = _courses[index];
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Course Name',
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                onChanged: (value) {
                  course.name = value;
                },
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Credit Hours',
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  course.credits = double.tryParse(value);
                },
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Grade',
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                value: course.grade,
                items: _grades.map((grade) {
                  return DropdownMenuItem<String>(
                    value: grade,
                    child: Text(grade),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    course.grade = value;
                  });
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _removeCourse(index),
            ),
          ],
        ),
      ),
    );
  }
}

class Course {
  String? name;
  double? credits;
  String? grade;
}

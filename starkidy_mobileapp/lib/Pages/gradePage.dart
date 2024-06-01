import 'package:flutter/material.dart';
import '../Components/headerBar.dart';

class GradePage extends StatefulWidget {
  @override
  _GradePageState createState() => _GradePageState();
}

class _GradePageState extends State<GradePage> {
  // Dropdown value
  String selectedYear = 'Tahun 1';

  // Data for grades, quizzes, and assignments
  final Map<String, List<Map<String, dynamic>>> gradeData = {
    "Tahun 1": [
      {
        "course": "PPL",
        "quizzes": [
          {"name": "Quiz 1", "score": 90},
          {"name": "Quiz 2", "score": 90},
        ],
        "assignments": [
          {"name": "Assignment 1", "score": 90},
          {"name": "Assignment 2", "score": 90},
        ],
      },
      {
        "course": "Alpro",
        "quizzes": [
          {"name": "Quiz 1", "score": 85},
          {"name": "Quiz 2", "score": 88},
        ],
        "assignments": [
          {"name": "Assignment 1", "score": 87},
          {"name": "Assignment 2", "score": 90},
        ],
      },
      {
        "course": "Matematika Diskrit",
        "quizzes": [
          {"name": "Quiz 1", "score": 80},
          {"name": "Quiz 2", "score": 82},
        ],
        "assignments": [
          {"name": "Assignment 1", "score": 83},
          {"name": "Assignment 2", "score": 85},
        ],
      },
    ],
    "Tahun 2": [
      {
        "course": "RPL",
        "quizzes": [
          {"name": "Quiz 1", "score": 92},
          {"name": "Quiz 2", "score": 90},
        ],
        "assignments": [
          {"name": "Assignment 1", "score": 91},
          {"name": "Assignment 2", "score": 92},
        ],
      },
      {
        "course": "Logmat",
        "quizzes": [
          {"name": "Quiz 1", "score": 85},
          {"name": "Quiz 2", "score": 87},
        ],
        "assignments": [
          {"name": "Assignment 1", "score": 86},
          {"name": "Assignment 2", "score": 89},
        ],
      },
      {
        "course": "AKA",
        "quizzes": [
          {"name": "Quiz 1", "score": 88},
          {"name": "Quiz 2", "score": 90},
        ],
        "assignments": [
          {"name": "Assignment 1", "score": 89},
          {"name": "Assignment 2", "score": 92},
        ],
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/gradeImage.png', // Change the image to grade related if needed
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Grades",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                DropdownButton<String>(
                  value: selectedYear,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedYear = newValue!;
                    });
                  },
                  items: <String>['Tahun 1', 'Tahun 2']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: gradeData[selectedYear]!.length,
              itemBuilder: (context, index) {
                final course = gradeData[selectedYear]![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Color.fromRGBO(90, 158, 183, 1),
                    child: ExpansionTile(
                      title: Text(
                        course['course']!,
                        style: TextStyle(color: Colors.white),
                      ),
                      children: <Widget>[
                        if (course.containsKey('quizzes'))
                          ...course['quizzes'].map<Widget>((quiz) {
                            return ListTile(
                              title: Text(
                                "${quiz['name']}: ${quiz['score']}",
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                        if (course.containsKey('assignments'))
                          ...course['assignments'].map<Widget>((assignment) {
                            return ListTile(
                              title: Text(
                                "${assignment['name']}: ${assignment['score']}",
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

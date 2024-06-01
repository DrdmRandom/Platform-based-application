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
          {"name": "Quiz 1", "score": "A"},
          {"name": "Quiz 2", "score": "A"},
        ],
        "assignments": [
          {"name": "Assignment 1", "score": "A"},
          {"name": "Assignment 2", "score": "A"},
        ],
      },
      {
        "course": "Alpro",
        "quizzes": [
          {"name": "Quiz 1", "score": "A"},
          {"name": "Quiz 2", "score": "A"},
        ],
        "assignments": [
          {"name": "Assignment 1", "score": "A"},
          {"name": "Assignment 2", "score": "A"},
        ],
      },
      {
        "course": "Matematika Diskrit",
        "quizzes": [
          {"name": "Quiz 1", "score": "A"},
          {"name": "Quiz 2", "score": "A"},
        ],
        "assignments": [
          {"name": "Assignment 1", "score": "A"},
          {"name": "Assignment 2", "score": "A"},
        ],
      },
    ],
    "Tahun 2": [
      {
        "course": "RPL",
        "quizzes": [
          {"name": "Quiz 1", "score": "A"},
          {"name": "Quiz 2", "score": "A"},
        ],
        "assignments": [
          {"name": "Assignment 1", "score": "A"},
          {"name": "Assignment 2", "score": "A"},
        ],
      },
      {
        "course": "Logmat",
        "quizzes": [
          {"name": "Quiz 1", "score": "A"},
          {"name": "Quiz 2", "score": "A"},
        ],
        "assignments": [
          {"name": "Assignment 1", "score": "A"},
          {"name": "Assignment 2", "score": "A"},
        ],
      },
      {
        "course": "AKA",
        "quizzes": [
          {"name": "Quiz 1", "score": "A"},
          {"name": "Quiz 2", "score": "A"},
        ],
        "assignments": [
          {"name": "Assignment 1", "score": "A"},
          {"name": "Assignment 2", "score": "A"},
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(value, style: TextStyle(color: Colors.black)),
                          ),
                        );
                      }).toList(),
                      icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                      dropdownColor: Colors.white,
                    ),
                  ),
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
                              tileColor: Colors.white,
                              title: Text(
                                quiz['name'],
                                style: TextStyle(color: Colors.blue),
                              ),
                              trailing: Text(
                                "${quiz['score']}",
                                style: TextStyle(color: Colors.blue),
                              ),
                            );
                          }).toList(),
                        if (course.containsKey('assignments'))
                          ...course['assignments'].map<Widget>((assignment) {
                            return ListTile(
                              tileColor: Colors.white,
                              title: Text(
                                assignment['name'],
                                style: TextStyle(color: Colors.blue),
                              ),
                              trailing: Text(
                                "${assignment['score']}",
                                style: TextStyle(color: Colors.blue),
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

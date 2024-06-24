import 'package:flutter/material.dart';
import '../Pages/quizPage.dart';
import '../Pages/assignmentPage.dart';
import '../Pages/newQuiz.dart'; // Import newQuiz.dart page
import '../Pages/newAssignment.dart'; // Import newAssignment.dart page

class QuizAssignmentListTeacherHome extends StatelessWidget {
  // List Map berisi Quiz dan Assignment
  final List<Map<String, String>> quizAssignmentList = [
    {"title": "New Assignment", "course": "New Assignment", "type": "NewAssignment"},
    {"title": "New Quiz", "course": "New Quiz", "type": "NewQuiz"},
    {"title": "Quiz 1", "course": "Rekayasa Perangkat Lunak", "type": "quiz"},
    {"title": "Assignment 1", "course": "Rekayasa Perangkat Lunak", "type": "assignment"},
    {"title": "Quiz 3", "course": "Rekayasa Perangkat Lunak", "type": "quiz"},
    {"title": "Assignment 4", "course": "Rekayasa Perangkat Lunak", "type": "assignment"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12, top: 10),
                  child: Text(
                    "Quiz & Assignment",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: quizAssignmentList.length,
              itemBuilder: (context, index) {
                final item = quizAssignmentList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Color.fromRGBO(90, 158, 183, 1), // Default color for regular items
                    child: Container(
                      width: 400,
                      child: ListTile(
                        title: Text(
                          item['title'] ?? '',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          item['course'] ?? '',
                          style: TextStyle(color: Colors.white70),
                        ),
                        onTap: () {
                          if (item['type'] == 'quiz') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => QuizPage()),
                            );
                          } else if (item['type'] == 'assignment') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AssignmentPage()),
                            );
                          } else if (item['type'] == 'NewAssignment'){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => newAssignment()),
                            );
                          } else if (item['type'] == 'NewQuiz'){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => newQuiz()),
                            );
                          }
                        },
                      ),
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
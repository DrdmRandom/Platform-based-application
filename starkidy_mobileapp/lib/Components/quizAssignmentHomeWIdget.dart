import 'package:flutter/material.dart';

class QuizAssignmentListHome extends StatelessWidget {
  // List Map berisi Quiz dan Assignment
  final List<Map<String, String>> quizAssignmentList = [
    {"title": "Quiz 1", "course": "Rekayasa Perangkat Lunak"},
    {"title": "Assignment 1", "course": "Rekayasa Perangkat Lunak"},
    {"title": "Quiz 3", "course": "Rekayasa Perangkat Lunak"},
    {"title": "Assignment 4", "course": "Rekayasa Perangkat Lunak"},
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
                    color: Color.fromRGBO(90, 158, 183, 1),
                    child: Container( // Menggunakan Container di sini
                      width: 400, // Menentukan lebar card
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
                          // Handle item tap
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

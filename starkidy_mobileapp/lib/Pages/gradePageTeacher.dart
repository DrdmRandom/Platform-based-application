import 'package:flutter/material.dart';
import '../Components/headerBar.dart'; // Ensure this path is correct

class GradeScreen extends StatefulWidget {
  @override
  _GradeScreenState createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen> {
  // Dropdown value
  String selectedStudent = 'John Doe';

  // Data for students and their grades
  final Map<String, List<Map<String, dynamic>>> studentData = {
    "John Doe": [
      {"course": "Kalkulus (03-A)", "grade": "A"},
      {"course": "Fisika (02-B)", "grade": "B"},
      {"course": "Rekayasa Perangkat Lunak (01-A)", "grade": "A"},
      {"course": "Teori Bahasa dan Automata (02-A)", "grade": "B"},
      {"course": "Jaringan Komputer (01-B)", "grade": "A"},
    ],
    "Jane Smith": [
      {"course": "Kalkulus (03-A)", "grade": "B"},
      {"course": "Fisika (02-B)", "grade": "A"},
      {"course": "Rekayasa Perangkat Lunak (01-A)", "grade": "B"},
      {"course": "Teori Bahasa dan Automata (02-A)", "grade": "A"},
      {"course": "Jaringan Komputer (01-B)", "grade": "B"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBar(), // Use the imported HeaderBar component
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Grades",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
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
                      value: selectedStudent,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedStudent = newValue!;
                        });
                      },
                      items: studentData.keys
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
              itemCount: studentData[selectedStudent]!.length + 1,
              itemBuilder: (context, index) {
                if (index == studentData[selectedStudent]!.length) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Add your edit button functionality here
                          },
                          child: Text('Edit', style: TextStyle(color: Colors.blue)),
                        ),
                        SizedBox(width: 8.0),
                        TextButton(
                          onPressed: () {
                            // Add your input button functionality here
                          },
                          child: Text('Input', style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                  );
                } else {
                  final course = studentData[selectedStudent]![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Color.fromRGBO(90, 158, 183, 1),
                      child: ListTile(
                        title: Text(
                          course['course']!,
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Text(
                          course['grade']!,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../Components/headerBar.dart'; // Ensure this path is correct
import '../Components/bottomNavBarTeacher.dart' as bottomnavbar;
import '../Components/headerBarTeacher.dart';

class GradeScreen extends StatefulWidget {
  @override
  _GradeScreenState createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen> {
  // Dropdown value
  String selectedSubject = 'Matematika'; // Corrected initial value
  bool isEditMode = false;

  // Data for students and their grades
  final Map<String, List<Map<String, dynamic>>> studentData = {
    "Matematika": [
      {"Student Name": "Aether", "grade": "C"},
      {"Student Name": "Cealus", "grade": "B"},
      {"Student Name": "Dawwi", "grade": "B"},
      {"Student Name": "Dinanti", "grade": "A"},
      {"Student Name": "Rover", "grade": "A"},
    ],
    "Fisika": [
      {"Student Name": "Aether", "grade": "E"},
      {"Student Name": "Cealus", "grade": "A"},
      {"Student Name": "Dawwi", "grade": "A"},
      {"Student Name": "Dinanti", "grade": "B"},
      {"Student Name": "Rover", "grade": "AB"},
    ],
  };

  void _toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  void _editGrade(int index) {
    if (!isEditMode) return;

    TextEditingController gradeController = TextEditingController(text: studentData[selectedSubject]![index]['grade']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Grade"),
          content: TextField(
            controller: gradeController,
            decoration: InputDecoration(labelText: "Grade"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  studentData[selectedSubject]![index]['grade'] = gradeController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void _showNotReadyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Info"),
          content: Text("This feature is not ready yet"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBarTeacher (), // Use the imported HeaderBar component
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
                      value: selectedSubject,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedSubject = newValue!;
                          isEditMode = false; // Disable edit mode when subject changes
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
              itemCount: studentData[selectedSubject]!.length,
              itemBuilder: (context, index) {
                final student = studentData[selectedSubject]![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Color.fromRGBO(90, 158, 183, 1),
                    child: ListTile(
                      title: Text(
                        student['Student Name']!,
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Text(
                        student['grade']!,
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        _editGrade(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          if (isEditMode)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Save changes
                      setState(() {
                        isEditMode = false;
                      });
                    },
                    child: Text('Input'),
                  ),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleEditMode,
        child: Icon(Icons.edit),
        backgroundColor: isEditMode ? Colors.yellow : Color.fromRGBO(90, 158, 183, 1),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../Components/headerBar.dart';
import '../Components/bottomNavbar.dart' as bottomnavbar;

class ReportBookPage extends StatefulWidget {
  @override
  _ReportBookPageState createState() => _ReportBookPageState();
}

class _ReportBookPageState extends State<ReportBookPage> {
  // Dropdown value
  String selectedStudent = 'John Doe';

  // Data for students (replace this with your actual student data)
  final Map<String, List<Map<String, dynamic>>> studentData = {
    "John Doe": [
      {"week": 1, "status": "Complete"},
      {"week": 2, "status": "Complete"},
      {"week": 3, "status": "Incomplete"},
      {"week": 4, "status": "Complete"},
      {"week": 5, "status": "Incomplete"},
    ],
    "Jane Smith": [
      {"week": 1, "status": "Incomplete"},
      {"week": 2, "status": "Complete"},
      {"week": 3, "status": "Complete"},
      {"week": 4, "status": "Incomplete"},
      {"week": 5, "status": "Complete"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBar(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.book, size: 40),
                      SizedBox(width: 10),
                      Text(
                        'Report Book',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
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
                padding: const EdgeInsets.all(8.0),
                itemCount: studentData[selectedStudent]!.length,
                itemBuilder: (context, index) {
                  final weekData = studentData[selectedStudent]![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(90, 158, 183, 1), // Background color
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Week ${weekData["week"]}', // Dynamic week text
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // Implement your edit logic here
                                  },
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(width: 10),
                                TextButton(
                                  onPressed: () {
                                    // Implement your input logic here
                                  },
                                  child: Text(
                                    'Input',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
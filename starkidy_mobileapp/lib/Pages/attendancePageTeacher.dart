import 'package:flutter/material.dart';
import '../Components/headerBar.dart';
import '../Components/bottomNavBarTeacher.dart' as bottomnavbar;
import '../Components/headerBarTeacher.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBarTeacher (),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
            child: Text(
              "Attendance",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                AttendanceCard(className: 'Kalkulus (03-A)'),
                AttendanceCard(className: 'Fisika (02-B)'),
                AttendanceCard(className: 'Rekayasa Perangkat Lunak (01-A)'),
                AttendanceCard(className: 'Teori Bahasa dan Automata (02-A)'),
                AttendanceCard(className: 'Jaringan Komputer (01-B)'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AttendanceCard extends StatelessWidget {
  final String className;

  AttendanceCard({required this.className});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(90, 158, 183, 1),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        onTap: () {
          // Handle card tap
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                className,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Add your edit button functionality here
                    },
                    child: Text('Edit', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: 8.0),
                  TextButton(
                    onPressed: () {
                      // Add your input button functionality here
                    },
                    child: Text('Input', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

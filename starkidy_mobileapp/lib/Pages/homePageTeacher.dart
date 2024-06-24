import 'package:flutter/material.dart';
import '../Components/headerBarTeacher.dart';
import '../Components/bottomNavbar.dart' as bottomnavbar;
import '../Components/quizAssignmentHomeWidgetTeacher.dart';
import '../Pages/chatPage.dart';
import '../Pages/profilePage.dart';
import '../Components/ScheduleWidget.dart';
import '../Pages/attendancePage.dart';
import 'gradePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBarTeacher(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    // Baris untuk Attendance, Grade, dan Report Book
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AttendancePage(studentId: '',)),
                            );
                          },
                          child: Column(
                            children: [
                              Icon(Icons.calendar_today_outlined, size: 60, color: Color.fromRGBO(90, 158, 183, 1)),
                              Text("Attendance"),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GradePage()),
                            );
                          },
                          child: Column(
                            children: [
                              Icon(Icons.grade_outlined, size: 60, color: Color.fromRGBO(90, 158, 183, 1)),
                              Text("Grade"),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Icon(Icons.book_outlined, size: 60, color: Color.fromRGBO(90, 158, 183, 1)),
                            Text("Report"),
                          ],
                        ),
                      ],
                    ),
                    ScheduleWidget(),
                    Expanded(
                      child: QuizAssignmentListTeacherHome(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
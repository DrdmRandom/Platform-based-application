import 'package:flutter/material.dart';
import 'package:starkidy_mobileapp/Pages/reportBookTeacher.dart';
import '../Components/TeacherscheduleWidget.dart';
import '../Components/headerBarTeacher.dart';
import '../Pages/chatPage.dart';
import '../Pages/profilePage.dart';
import '../Components/quizAssignmentHomeWidgetTeacher.dart';
import '../Components/ScheduleWidget.dart';
import 'attendancePageTeacher.dart';
import 'gradePageTeacher.dart';
import '../Pages/reportBook.dart'; // Import the TeacherReportBookPage

class HomePageTeacher extends StatefulWidget {
  @override
  _HomePageStateTeacher createState() => _HomePageStateTeacher();
}

class _HomePageStateTeacher extends State<HomePageTeacher> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    ChatPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBarTeacher(),
      )
          : null,
      body: SafeArea(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                          MaterialPageRoute(builder: (context) => AttendancePageTeacher()),
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
                          MaterialPageRoute(builder: (context) => GradeScreen()),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(Icons.grade_outlined, size: 60, color: Color.fromRGBO(90, 158, 183, 1)),
                          Text("Grade"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TeacherReportBook()), // Navigate to TeacherReportBookPage
                        );
                      },
                      child: Column(
                        children: [
                          Icon(Icons.book_outlined, size: 60, color: Color.fromRGBO(90, 158, 183, 1)),
                          Text("Report"),
                        ],
                      ),
                    ),
                  ],
                ),
                TeacherScheduleWidget(),
                Expanded(
                  child: QuizAssignmentListTeacherHome(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

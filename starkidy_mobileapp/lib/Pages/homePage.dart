import 'package:flutter/material.dart';
import 'package:starkidy_mobileapp/Pages/reportBook.dart';
import '../Components/headerBar.dart';
import '../Components/bottomNavbar.dart' as bottomnavbar;
import '../Pages/chatPage.dart';
import '../Pages/profilePage.dart';
import '../Components/ScheduleWidget.dart';
import '../Components/quizAssignmentHomeWIdget.dart';
import '../Pages/attendancePage.dart';
import 'gradePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
    }
  }

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

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => StudentReportBook()),
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
                    ScheduleWidget(),
                    Expanded(
                      child: QuizAssignmentListHome(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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

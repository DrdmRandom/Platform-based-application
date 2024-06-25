import 'package:flutter/material.dart';
import '../Components/headerBar.dart';
import '../controllers/attendance_controller.dart';

class AttendancePage extends StatelessWidget {
  final String studentId;

  AttendancePage({required this.studentId});

  final AttendanceController _attendanceController = AttendanceController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBar(),
      ),
      body: FutureBuilder<Map<String, List<Map<String, dynamic>>>>(
        future: _attendanceController.fetchAttendance(studentId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No attendance data found.'));
          } else {
            final attendanceData = snapshot.data!;
            return Column(
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
                            'assets/attendanceImage.png',
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Attendance",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: attendanceData.length,
                    itemBuilder: (context, index) {
                      final title = attendanceData.keys.toList()[index];
                      final List<Map<String, dynamic>> courses = attendanceData[title]!;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Color.fromRGBO(90, 158, 183, 1),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(title),
                                    content: SizedBox(
                                      width: double.maxFinite,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: courses.length,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            color: Color.fromRGBO(90, 158, 183, 1),
                                            child: ListTile(
                                              title: Text(
                                                  courses[index]['course'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12)),
                                              trailing: Text(
                                                  "${courses[index]['attendance']}%",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: 400,
                              child: ListTile(
                                title: Text(
                                  title,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
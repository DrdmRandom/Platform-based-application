import 'package:flutter/material.dart';
import 'AttendanceInputPage.dart';
import '../Components/headerBarTeacher.dart';

class ClassSchedule {
  final String mataKuliah;
  final String waktu;
  final String ruangan;
  final String kelas;

  ClassSchedule({
    required this.mataKuliah,
    required this.waktu,
    required this.ruangan,
    required this.kelas,
  });
}

class AttendancePageTeacher extends StatefulWidget {
  @override
  _AttendancePageTeacherState createState() => _AttendancePageTeacherState();
}

class _AttendancePageTeacherState extends State<AttendancePageTeacher> {
  final Map<int, List<ClassSchedule>> weeklySchedule = {
    1: [
      ClassSchedule(mataKuliah: "Matematika", waktu: "08:00-09:30", ruangan: "Gedung A - 0101", kelas: "Kelas 07-03"),
      ClassSchedule(mataKuliah: "Fisika", waktu: "12:00-13:30", ruangan: "Gedung C - 0103", kelas: "Kelas 07-03")
    ],
    2: [
      ClassSchedule(mataKuliah: "Matematika", waktu: "12:00-13:30", ruangan: "Gedung B - 0101", kelas: "Kelas 09-02"),
    ],
    3: [
      ClassSchedule(mataKuliah: "Matematika", waktu: "08:00-09:30", ruangan: "Gedung A - 0101", kelas: "Kelas 08-01"),
      ClassSchedule(mataKuliah: "Fisika", waktu: "10:00-11:30", ruangan: "Gedung B - 0301", kelas: "Kelas 08-02"),
      ClassSchedule(mataKuliah: "Fisika", waktu: "12:00-13:30", ruangan: "Gedung A - 0105", kelas: "Kelas 08-01"),
    ],
    4: [
      ClassSchedule(mataKuliah: "Fisika", waktu: "08:00-09:30", ruangan: "Gedung F - 0401", kelas: 'Kelas 08-03'),
      ClassSchedule(mataKuliah: "Matematika", waktu: "10:00-11:30", ruangan: "Gedung A - 0201", kelas: 'Kelas 09-02'),
      ClassSchedule(mataKuliah: "Fisika", waktu: "12:00-13:30", ruangan: "Gedung A - 0102", kelas: 'Kelas 07-01'),
    ],
    5: [
      ClassSchedule(mataKuliah: "Fisika", waktu: "08:00-09:30", ruangan: "Gedung A - 0301", kelas: 'Kelas 09-02'),
    ]
  };

  List<ClassSchedule> todaySchedule = [];

  @override
  void initState() {
    super.initState();
    final int today = DateTime.now().weekday;
    if (weeklySchedule.containsKey(today)) {
      setState(() {
        todaySchedule = weeklySchedule[today]!;
      });
    }
  }

  void _navigateToAttendanceInput(String mataKuliah, String kelas) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AttendanceInputPage(mataKuliah: mataKuliah, kelas: kelas),
      ),
    );
    if (result != null && result) {
      // Do something if attendance was successfully filled
      print('Attendance was filled.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBarTeacher(),
      ),
      body: todaySchedule.isNotEmpty
          ? ListView.builder(
        itemCount: todaySchedule.length,
        itemBuilder: (context, index) {
          final schedule = todaySchedule[index];
          return Card(
            color: Color.fromRGBO(90, 158, 183, 1),
            child: ListTile(
              title: Text(
                schedule.mataKuliah,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                '${schedule.waktu} - ${schedule.kelas}',
                style: TextStyle(color: Colors.white70),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  _navigateToAttendanceInput(schedule.mataKuliah, schedule.kelas);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button color
                  foregroundColor: Color.fromRGBO(90, 158, 183, 1), // Text color
                ),
                child: Text('Fill Attendance'),
              ),
            ),
          );
        },
      )
          : Center(
        child: Text('No classes scheduled for today'),
      ),
    );
  }
}

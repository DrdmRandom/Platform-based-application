import 'package:flutter/material.dart';

class ClassSchedule {
  final String mataKuliah;
  final String waktu;
  final String ruangan;
  final String Kelas;


  ClassSchedule({
    required this.mataKuliah,
    required this.waktu,
    required this.ruangan,
    required this.Kelas
  });

  DateTime getStartTime() {
    final timeParts = waktu.split('-')[0].split(':');
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, int.parse(timeParts[0]), int.parse(timeParts[1]));
  }

  DateTime getEndTime() {
    final timeParts = waktu.split('-')[1].split(':');
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, int.parse(timeParts[0]), int.parse(timeParts[1]));
  }
}

class TeacherScheduleWidgTeacheretController extends ChangeNotifier {
  List<ClassSchedule> schedules = [];

  // Weekly schedule data moved into the controller
  final Map<int, List<ClassSchedule>> weeklySchedule = {
    1: [ // Monday
      ClassSchedule(mataKuliah: "Matematika", waktu: "08:00-09:30", ruangan: "Gedung A - 0101", Kelas: "Kelas 07-03"),
      ClassSchedule(mataKuliah: "Fisika", waktu: "12:00-13:30", ruangan: "Gedung C - 0103", Kelas: "Kelas 07-01")
    ],
    2: [ // Tuesday
      ClassSchedule(mataKuliah: "Matematika", waktu: "12:00-13:30", ruangan: "Kolam Renang - 0001",Kelas: "Kelas 09-02"),
    ],
    3: [ // Wednesday
      ClassSchedule(mataKuliah: "Matematika", waktu: "08:00-09:30", ruangan: "Gedung A - 0101", Kelas: "Kelas 08-01"),
      ClassSchedule(mataKuliah: "Fisika", waktu: "10:00-11:30", ruangan: "Gedung B - 0301", Kelas: "Kelas 08-02"),
      ClassSchedule(mataKuliah: "Fisika", waktu: "12:00-13:30", ruangan: "Gedung A - 0105", Kelas: "Kelas 08-01"),
    ],
    4: [ // Thursday
      ClassSchedule(mataKuliah: "Fisika", waktu: "08:00-09:30", ruangan: "Gym - 0401", Kelas: 'Kelas 08-03'),
      ClassSchedule(mataKuliah: "Matematika", waktu: "10:00-11:30", ruangan: "Gedung A - 0201", Kelas: 'Kelas 09-02'),
      ClassSchedule(mataKuliah: "Fisika", waktu: "12:00-13:30", ruangan: "Gedung A - 0102", Kelas: 'Kelas 07-01'),
    ],
    5: [ // Friday
      ClassSchedule(mataKuliah: "Fisika", waktu: "08:00-09:30", ruangan: "Gedung A - 0301", Kelas: 'Kelas 09-02'),
    ]
  };

  List<ClassSchedule> getTodaySchedule() {
    final today = DateTime.now().weekday;
    return weeklySchedule[today] ?? [];
  }
}

class TeacherScheduleWidget extends StatelessWidget {
  final TeacherScheduleWidgTeacheretController controller = TeacherScheduleWidgTeacheretController();

  String getStatus(ClassSchedule schedule) {
    final now = DateTime.now();
    if (now.isBefore(schedule.getStartTime())) {
      if (schedule.getStartTime().difference(now).inMinutes <= 30) {
        return "Segera Dimulai";
      }
      return "Belum Dimulai";
    } else if (now.isAfter(schedule.getEndTime())) {
      return "Selesai";
    } else {
      return "Sedang Berlangsung";
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Belum Dimulai":
        return Colors.grey;
      case "Segera Dimulai":
        return Colors.yellow;
      case "Sedang Berlangsung":
        return Colors.blue;
      case "Selesai":
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final todaySchedule = controller.getTodaySchedule();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12, top: 10),
                child: Text(
                  "Jadwal Sedang Berlangsung",
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: todaySchedule.map((schedule) {
              final status = getStatus(schedule);
              final statusColor = getStatusColor(status);
              return GestureDetector(
                onTap: () {
                  // Handle card tap here
                },
                child: Container(
                  margin: EdgeInsets.all(25),
                  padding: EdgeInsets.all(5),
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First row: Course name
                        Text(
                          schedule.mataKuliah,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black, // Ubah warna teks menjadi hitam
                          ),
                        ),
                        SizedBox(height: 10),
                        // Second row: Radio button and status
                        Row(
                          children: [
                            // Letakkan radio button di sebelah kiri
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: statusColor,
                              ),
                            ),
                            Text(
                              status,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // Third row: Grid layout for time, room, and instructor code
                        Flexible(
                          child: GridView.count(
                            crossAxisCount: 3,
                            childAspectRatio: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              // Grid item for Time
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Waktu',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black, // Ubah warna teks menjadi hitam
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      schedule.waktu,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(90, 158, 183, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Grid item for Room
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ruangan',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black, // Ubah warna teks menjadi hitam
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      schedule.ruangan,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(90, 158, 183, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Grid item for Instructor Code
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kode Guru',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black, // Ubah warna teks menjadi hitam
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      schedule.Kelas,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(90, 158, 183, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: TeacherScheduleWidget(),
    ),
  ));
}

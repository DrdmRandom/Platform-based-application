import 'package:flutter/material.dart';
import '../Components/headerBar.dart';

class AttendancePage extends StatelessWidget {
  // Map untuk menyimpan data kehadiran
  final Map<String, List<Map<String, dynamic>>> attendanceData = {
    "Tahun 1 Semester 1": [
      {"course": "RPL", "attendance": 30},
      {"course": "Logmat", "attendance": 40},
      {"course": "Pemprog", "attendance": 50}
    ],
    "Tahun 1 Semester 2": [
      {"course": "PPL", "attendance": 100},
      {"course": "Matdis", "attendance": 100},
      {"course": "Alpro", "attendance": 100}
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBar(),
      ),
      body: Column(
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
                      height: 100, // Sesuaikan tinggi gambar sesuai kebutuhan
                      width: 100, // Sesuaikan lebar gambar sesuai kebutuhan
                    ),
                    SizedBox(
                        width:
                        8), // Berikan jarak horizontal antara gambar dan teks
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
                final List<Map<String, dynamic>> courses =
                attendanceData[title]!;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Color.fromRGBO(90, 158, 183, 1),
                    child: InkWell(
                      onTap: () {
                        // Handle card tap
                      },
                      child: Container(
                        width: 400,
                        child: ListTile(
                          title: Text(
                            title,
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            // Menampilkan dialog dengan list mata kuliah dan kehadiran
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
                                          color: Color.fromRGBO(90, 158, 183,
                                              1), // Atur warna latar belakang kartu menjadi biru
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
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
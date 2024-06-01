import 'package:flutter/material.dart';

class ScheduleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data
    String mataKuliah = "CRI3G3 - Rekayasa Perangkat Lunak";
    String waktu = "08:30-11:30";
    String ruangan = "TULT 0714";
    String kodeDosen = "HPY";

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
            children: [
              GestureDetector(
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
                          mataKuliah,
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
                            Radio(
                              value: 1,
                              groupValue: 1,
                              onChanged: (value) {},
                              activeColor: Color.fromRGBO(90, 158, 183, 1), // Ubah warna radio button
                            ),
                            Text(
                              'Sedang Berlangsung',
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
                                      waktu,
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
                                      ruangan,
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
                                    'Kode Dosen',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black, // Ubah warna teks menjadi hitam
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      kodeDosen,
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
              ),
              // Additional cards can be added here in the same format
            ],
          ),
        ),
      ],
    );
  }
}

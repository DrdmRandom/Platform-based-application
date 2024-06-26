import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String userName = "User"; // Ganti dengan nama pengguna sesuai kebutuhan
    String userClass = "Kelas 8"; // Ganti dengan kelas pengguna sesuai kebutuhan
    String greeting = "Hello, $userName!";
    String currentDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    String currentTime = DateFormat('HH:mm:ss').format(DateTime.now());

    return Container(
      width: 360,
      height: 135,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Profile
            Row(
              children: [
                Icon(Icons.account_circle, size: 48, color: Color.fromRGBO(90, 158, 183, 1)), // Icon profil
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(greeting, style: TextStyle(fontSize: 18)), // Sambutan
                    Text(userClass, style: TextStyle(fontSize: 16)), // Kelas
                  ],
                ),
              ],
            ),
            // Tanggal dan waktu saat ini
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(currentDate, style: TextStyle(fontSize: 16)), // Tanggal
                Text(currentTime, style: TextStyle(fontSize: 16)), // Waktu
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../Components/headerBar.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class AssignmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/gradeImage.png', // Change the image to assignment related if needed
                  height: 100,
                  width: 100,
                ),
                SizedBox(width: 8),
                Text(
                  "Assignment",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Assignment details
            Card(
              elevation: 3,
              shadowColor: Colors.grey,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Assignment Kalkulus 4",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Buatlah rangkuman mengenai archon quest Fontaine Terbaru dan Story Quest Arlecchino dengan penjelasan yang rinci. Akan mendapatkan nilai bonus apabila kalian menghighlight bagian penting (teori yang akan sambung ke archon quest selanjutnya)",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Due Date: Sunday, 19 May 2024, 11:59 PM",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    TimerCountdown(
                      format: CountDownTimerFormat.daysHoursMinutesSeconds,
                      endTime: DateTime.now().add(Duration(days: 10)),
                      onEnd: () {
                        print("Timer finished");
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Add file attachment logic here
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.attach_file),
                          SizedBox(width: 10),
                          Text(
                            "Attach File",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Are you sure with your answers?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text("Back to Quiz"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Add your finish quiz logic here
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text("Finish"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Finish'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

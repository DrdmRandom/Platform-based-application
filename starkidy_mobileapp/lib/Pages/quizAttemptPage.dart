import 'package:flutter/material.dart';
import '../Components/headerBar.dart';
import 'package:radio_group_v2/radio_group_v2.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class QuizAttemptPage extends StatefulWidget {
  @override
  _QuizAttemptPageState createState() => _QuizAttemptPageState();
}

class _QuizAttemptPageState extends State<QuizAttemptPage> {
  // List of questions with their options
  final List<Map<String, dynamic>> questions = [
    {
      "question": "Siapakah husbu pertamanya ren ?",
      "options": ["a. kaveh", "b. aventurine", "c. chuuya", "d. vyn"],
    },
    {
      "question": "Pada hari apa berlangsungnya off topic ?",
      "options": ["a. senin", "b. selasa", "c. rabu", "d. kamis"],
    },
    {
      "question": "Pada hari apa berlangsungnya off topic ?",
      "options": ["a. senin", "b. selasa", "c. rabu", "d. kamis"],
    },
    // Add more questions here
  ];

  // Radio group controller
  late RadioGroupController<String> radioGroupController;

  @override
  void initState() {
    super.initState();
    // Always initialize radio group controller
    radioGroupController = RadioGroupController();
  }

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
                  'assets/gradeImage.png', // Change the image to quiz related if needed
                  height: 100,
                  width: 100,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quiz",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    TimerCountdown(
                      format: CountDownTimerFormat.hoursMinutesSeconds,
                      endTime: DateTime.now().add(Duration(
                          minutes:
                              10)), // Set the countdown duration to 10 minutes
                      onEnd: () {
                        print("Timer finished");
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: questions.map((question) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        elevation: 3,
                        color: Colors.white, // Set card color to white
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Question ${questions.indexOf(question) + 1}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                question["question"],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 16),
                              RadioGroup<String>(
                                controller: radioGroupController,
                                values: question["options"] as List<String>,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
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

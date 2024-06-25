import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import '../Components/headerBar.dart';
import '../controllers/quizController.dart';

class QuizAttemptPage extends StatefulWidget {
  @override
  _QuizAttemptPageState createState() => _QuizAttemptPageState();
}

class _QuizAttemptPageState extends State<QuizAttemptPage> {
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
    {
      "question": "Berapakah hasil dari 7 + 8 ?",
      "options": ["a. 14", "b. 15", "c. 16", "d. 17"],
    },
    {
      "question": "Jika x = 5, berapakah hasil dari 3x + 2 ?",
      "options": ["a. 15", "b. 16", "c. 17", "d. 18"],
    },
    {
      "question": "Berapakah hasil dari 12 x 3 ?",
      "options": ["a. 36", "b. 35", "c. 34", "d. 33"],
    },
    {
      "question": "Sebuah persegi memiliki sisi sepanjang 4 cm. Berapakah luasnya?",
      "options": ["a. 12 cm²", "b. 14 cm²", "c. 16 cm²", "d. 18 cm²"],
    },
    {
      "question": "Jika y = 3 dan z = 4, berapakah hasil dari y² + z² ?",
      "options": ["a. 24", "b. 25", "c. 26", "d. 27"],
    },
    {
      "question": "Berapakah hasil dari 100 / 4 ?",
      "options": ["a. 20", "b. 25", "c. 30", "d. 35"],
    },
    {
      "question": "Sebuah lingkaran memiliki jari-jari sepanjang 7 cm. Berapakah kelilingnya? (π = 22/7)",
      "options": ["a. 38 cm", "b. 42 cm", "c. 44 cm", "d. 46 cm"],
    },
    {
      "question": "Jika a = 8 dan b = 6, berapakah hasil dari a² - b² ?",
      "options": ["a. 12", "b. 18", "c. 28", "d. 36"],
    },
    {
      "question": "Berapakah hasil dari 9 x 9 ?",
      "options": ["a. 80", "b. 81", "c. 82", "d. 83"],
    },
  ];

  final List<String> correctAnswers = [
    "c. chuuya",
    "c. rabu",
    "c. rabu",
    "d. 17",
    "c. 17",
    "a. 36",
    "c. 16 cm²",
    "b. 25",
    "b. 25",
    "c. 44 cm",
    "c. 28",
    "b. 81"
  ];

  List<String> userAnswers = List.filled(12, '');

  late QuizController quizController;

  @override
  void initState() {
    super.initState();
    quizController = QuizController(
      questions: questions,
      correctAnswers: correctAnswers,
    );
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
                          minutes: 10)), // Set the countdown duration to 10 minutes
                      onEnd: () {
                        _finishQuiz();
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
                    int questionIndex = questions.indexOf(question);
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
                                "Question ${questionIndex + 1}",
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
                              Column(
                                children: (question["options"] as List<String>).map((option) {
                                  return RadioListTile<String>(
                                    title: Text(option),
                                    value: option,
                                    groupValue: userAnswers[questionIndex],
                                    onChanged: (value) {
                                      setState(() {
                                        userAnswers[questionIndex] = value!;
                                        quizController.setUserAnswer(questionIndex, value);
                                      });
                                    },
                                  );
                                }).toList(),
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
                              Navigator.of(context).pop();
                            },
                            child: Text("Back to Quiz"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              int score = quizController.calculateScore();
                              Navigator.of(context).pop();
                              _showScoreDialog(score);
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

  void _showScoreDialog(int score) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Quiz Completed"),
          content: Text("Your score is $score/${questions.length}"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamedAndRemoveUntil('/homePage', (Route<dynamic> route) => false);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _finishQuiz() {
    int score = quizController.calculateScore();
    _showScoreDialog(score);
  }
}

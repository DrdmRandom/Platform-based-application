import 'package:flutter/material.dart';
import 'package:starkidy_mobileapp/Pages/splashScreen.dart';
import '../Pages/homePage.dart';
import '../Pages/quizAttemptPage.dart'; // Import your quiz page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/homePage': (context) => HomePage(), // Define the home page route
        '/quiz': (context) => QuizAttemptPage(), // Define the quiz page route
      },
      home: SplashScreen(), // Set the initial route to HomePage
    );
  }
}

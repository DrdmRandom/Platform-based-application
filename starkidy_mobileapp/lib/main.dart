import 'package:flutter/material.dart';
import 'package:starkidy_mobileapp/Pages/splashScreen.dart';
import 'package:starkidy_mobileapp/Pages/homePage.dart';
import 'package:starkidy_mobileapp/Pages/quizAttemptPage.dart';
import 'package:starkidy_mobileapp/Pages/loginScreen.dart';
import 'package:starkidy_mobileapp/Pages/loginScreenTeacher.dart';
import 'package:starkidy_mobileapp/Pages/reportBookTeacher.dart'; // Import TeacherReportBookPage
import 'package:starkidy_mobileapp/Pages/reportBook.dart';

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
        '/homePage': (context) => HomePage(),
        '/quiz': (context) => QuizAttemptPage(),
        '/loginStudent': (context) => LoginScreen(),
        '/loginTeacher': (context) => LoginScreenTeacher(),
        '/teacherReportBook': (context) => TeacherReportBook(),
        '/studentReportBook': (context) => StudentReportBook(),
      },
      home: SplashScreen(),
    );
  }
}

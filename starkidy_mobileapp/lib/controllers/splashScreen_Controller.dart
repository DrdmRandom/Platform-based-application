import 'package:flutter/material.dart';
import '../Pages/loginScreen.dart';
import '../Pages/loginScreenTeacher.dart';

class SplashScreenController {
  void navigateToStudentLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void navigateToTeacherLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreenTeacher()),
    );
  }
}

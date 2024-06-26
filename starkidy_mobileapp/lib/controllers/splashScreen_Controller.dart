import 'package:flutter/material.dart';
import '../Pages/loginScreen.dart';
import '../Pages/loginScreenTeacher.dart';

class SplashScreenController {
  void navigateToStudentLogin(BuildContext context) {
    Navigator.pushNamed(context, '/loginStudent');
  }

  void navigateToTeacherLogin(BuildContext context) {
    Navigator.pushNamed(context, '/loginTeacher');
  }
}
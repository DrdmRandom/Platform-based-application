import 'package:flutter/material.dart';
import '../controllers/splashScreen_Controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _logoOpacity = 0.0;
  double _buttonsOpacity = 0.0;
  final SplashScreenController _controller = SplashScreenController();

  @override
  void initState() {
    super.initState();
    _fadeInLogo();
  }

  void _fadeInLogo() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _logoOpacity = 1.0;
      });
      _fadeInButtons();
    });
  }

  void _fadeInButtons() {
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _buttonsOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _logoOpacity,
              duration: Duration(seconds: 2),
              child: Image.asset(
                'assets/logo.png',
                height: 400,
                width: 400,
              ),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: _buttonsOpacity,
              duration: Duration(seconds: 2),
              child: Column(
                children: [
                  buildButton('Student', () => _controller.navigateToStudentLogin(context)),
                  SizedBox(height: 10),
                  buildButton('Teacher', () => _controller.navigateToTeacherLogin(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String text, VoidCallback onPressed) {
    return Container(
      width: 200,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: Color.fromRGBO(90, 158, 183, 1), width: 2),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Color.fromRGBO(90, 158, 183, 1),
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

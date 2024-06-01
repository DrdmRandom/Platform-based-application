// lib/splash_screen.dart

import 'package:flutter/material.dart';
import 'loginScreen.dart'; // Import the LoginScreen widget

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your splash screen content here
            Image.asset(
              'assets/logo.png', // Path to your logo image
              height: 400,
              width: 400,
            ),
            SizedBox(height: 20),
            buildButton('Student', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            }),
            SizedBox(height: 10),
            buildButton('Teacher', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            }),
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
            side: BorderSide(color: Color.fromRGBO(90, 158, 183, 1), width: 2), // Add border color here
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

import 'package:flutter/material.dart';
import '../Components/headerBarTeacher.dart' as bottomnavbar;
import '../Components/headerBarTeacher.dart';
import '../Pages/homePage.dart';
import '../Pages/chatPage.dart';

class TeacherProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBarTeacher(),
      ),
      body: TeacherProfileBody(), // Custom profile body widget
    );
  }
}

class TeacherProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/avatar.png'), // Placeholder image
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Teacher Name',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Rekayasa Perangkat Lunak Lecture',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(height: 1, color: Colors.grey),
        ListTile(
          leading: Icon(Icons.email),
          title: Text('teacher@example.com'),
          onTap: () {
            // Handle tapping the email
          },
        ),
        Divider(height: 1, color: Colors.grey),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('+1234567890'),
          onTap: () {
            // Handle tapping the phone number
          },
        ),
        Divider(height: 1, color: Colors.grey),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('New York, USA'),
          onTap: () {
            // Handle tapping the location
          },
        ),
        // Add more ListTile widgets for additional profile information
        // Example: Bio, social media links, etc.
        SizedBox(height: 20),
      ],
    );
  }
}
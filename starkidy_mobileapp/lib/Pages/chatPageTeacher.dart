import 'package:flutter/material.dart';
import '../Components/bottomNavBarTeacher.dart';
import '../Components/headerBarTeacher.dart'; //sss
import '../Pages/homePageTeacher.dart';
import '../Pages/profilePageTeacher.dart';
import 'messagePageTeacher.dart';

class TeacherChatPage extends StatelessWidget {
  final List<String> people = [
    'Mr. John Doe',
    'Mr. Jane Smith',
    'Michael Johnson (02-A)',
    'Emily Brown (02-B)',
    'David Wilson (02-A)',
    'Sarah Lee (02-B)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderBarTeacher(), // Use PascalCase for your custom widget names
          Expanded(
            child: ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, index) {
                return _buildPersonCard(context, people[index]);
              },
            ),
          ),
        ],
      ), // Add BottomNavigationBarTeacher
    );
  }

  Widget _buildPersonCard(BuildContext context, String name) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white, // Set card color to white
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MessagePageTeacher(personName: name),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(Icons.person, size: 48.0, color: Colors.blue),
              SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
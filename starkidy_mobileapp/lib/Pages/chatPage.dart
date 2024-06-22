import 'package:flutter/material.dart';
import '../Components/headerBar.dart'; // Import your headerBar.dart file
import '../Components/bottomNavBar.dart'; // Import your bottomNavBart.dart file
import 'messagePage.dart'; // Import your messagePage.dart file

class ChatPage extends StatelessWidget {
  final List<String> people = [
    'John Doe',
    'Jane Smith',
    'Michael Johnson',
    'Emily Brown',
    'David Wilson',
    'Sarah Lee',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderBar(), // Use PascalCase for your custom widget names
          Expanded(
            child: ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, index) {
                return _buildPersonCard(context, people[index]);
              },
            ),
          ),
        ],
      ),
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
          // Navigate to MessagePage when card is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MessagePage(personName: name),
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
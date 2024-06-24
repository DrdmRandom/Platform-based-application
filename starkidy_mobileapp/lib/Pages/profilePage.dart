import 'package:flutter/material.dart';
import '../Components/headerBar.dart'; // Assuming this is defined in headerBar.dart
import '../Pages/homePage.dart';
import '../Pages/chatPage.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBar(),
      ),
      body: ProfileBody(), // Custom profile body widget
    );
  }
}

class ProfileBody extends StatelessWidget {
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
                    'User',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '02-A',
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
          title: Text('User@example.com'),
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
          title: Text('Bojongsoang, Bandung'),
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
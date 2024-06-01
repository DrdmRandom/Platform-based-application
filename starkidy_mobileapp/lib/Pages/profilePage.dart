import 'package:flutter/material.dart';
import '../Components/headerBar.dart';
import '../Components/bottomNavbar.dart' as bottomnavbar;
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
      body: Placeholder(),
    );
  }
}

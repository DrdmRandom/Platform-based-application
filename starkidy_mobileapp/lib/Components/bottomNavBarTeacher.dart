import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../Pages/chatPageTeacher.dart';
import '../Pages/homePageTeacher.dart';
import '../Pages/profilePageTeacher.dart';

class BottomNavigationBarTeacher extends StatefulWidget {
  const BottomNavigationBarTeacher({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarTeacher> createState() => _BottomNavigationBarTeacherState();
}

class _BottomNavigationBarTeacherState extends State<BottomNavigationBarTeacher> {
  int pageIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: pageIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        children: [
          HomePageTeacher(),
          TeacherChatPage(),
          TeacherProfilePage(),
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.home_outlined,
          Icons.chat_outlined,
          Icons.person_outlined,
        ],
        inactiveColor: Color.fromRGBO(116, 116, 116, 1),
        activeColor: Color.fromRGBO(90, 158, 183, 1),
        gapLocation: GapLocation.none,
        activeIndex: pageIndex,
        leftCornerRadius: 10,
        iconSize: 30,
        rightCornerRadius: 0,
        elevation: 0,
        onTap: (index) {
          setState(() {
            pageIndex = index;
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
        },
      ),
    );
  }
}
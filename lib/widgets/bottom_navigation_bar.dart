import 'package:flutter/material.dart';
import 'package:mpp/pages/quiz.dart';
import 'package:mpp/style.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final int currentIndex;

  MyBottomNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_filled),
        ),
        BottomNavigationBarItem(
          label: 'Quiz',
          icon: Icon(Icons.quiz_rounded),
        ),
      ],
      selectedItemColor: secondaryColor,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex =
              index; // Update _selectedIndex with the new index value
          if (_selectedIndex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizGame(),
              ),
            );
          }
        });
      },
    );
  }
}

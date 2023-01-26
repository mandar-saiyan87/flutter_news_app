// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int index;
  const BottomNavBar({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      items: [
        BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(left: 50),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: Icon(Icons.home),
              ),
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/discover');
              },
              icon: Icon(Icons.search),
            ),
            label: 'Search'),
        BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(right: 50),
              child: IconButton(
                onPressed: () {
                  print('Profile not available');
                },
                icon: Icon(Icons.person),
              ),
            ),
            label: 'Profile'),
      ],
    );
  }
}

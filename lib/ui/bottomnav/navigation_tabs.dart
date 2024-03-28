// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:horeb_telugu_reference_bible/pages/books/index.dart';
import 'package:horeb_telugu_reference_bible/ui/common/page_corner_bg.dart';
import 'package:horeb_telugu_reference_bible/ui/bottomnav/navbar_icon.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const BooksPage(),
    const SecondPage(),
    const ThirdPage(),
    const FourthPage(),
    const FifthPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pageBackgroundImage(),
          // Page content
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            child: _pages[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: const Color(0xFFA0642F), // icon color
        backgroundColor: Colors.white,
        height: 50,
        items: <Widget>[
          buildIcon(Icons.menu_book, 0),
          buildIcon(Icons.search, 1),
          buildIcon(Icons.bookmarks, 2),
          buildIcon(Icons.notes, 3),
          buildIcon(Icons.settings, 4)
        ],
        index: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Second Page'),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Third Page'),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Fourth Page'),
    );
  }
}

class FifthPage extends StatelessWidget {
  const FifthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Fifth Page'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:horeb_telugu_reference_bible/ui/appbar.dart';
import 'package:horeb_telugu_reference_bible/ui/page_corner_bg.dart';

class BooksList extends StatelessWidget {
  const BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            pageBackgroundImage(),
            // AppBar with transparent background
            CustomAppBar(),
            // Your page content
            const Center(
              child: Text(
                'Page Content',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

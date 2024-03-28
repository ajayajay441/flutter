// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:horeb_telugu_reference_bible/ui/bottomnav/navigation_tabs.dart';
import 'package:horeb_telugu_reference_bible/ui/common/page_corner_bg_widget.dart';
// import 'package:horeb_telugu_reference_bible/pages/loader/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const LoadingPage();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              // Add background image
              pageBackgroundImage(),
              // Your app content goes here
              const BottomNavBar(),
            ],
          ),
        ));
  }
}

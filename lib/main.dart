// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:horeb_telugu_reference_bible/ui/bottomnav/navigation_tabs.dart';
// import 'package:horeb_telugu_reference_bible/ui/common/page_corner_bg_widget.dart';
// // import 'package:horeb_telugu_reference_bible/pages/loader/index.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // return const LoadingPage();
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           body: Stack(
//             fit: StackFit.expand,
//             children: [
//               // Add background image
//               pageBackgroundImage(),
//               // Your app content goes here
//               const BottomNavBar(),
//             ],
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';

class TextWithBackground extends StatelessWidget {
  final String longText =
      'This is a long text with a matched substring somewhere in the middle.';
  final String matchedSubstring = 'This is';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildTextWithBackground(),
        ),
      ),
    );
  }

  Widget buildTextWithBackground() {
    // Find the index of the matched substring in the long text
    int matchIndex = longText.indexOf(matchedSubstring);

    // If the matched substring is found, split the text into segments
    if (matchIndex != -1) {
      return Stack(
        children: [
          // Text widget
          Text(
            longText.substring(0, matchIndex) +
                matchedSubstring +
                longText.substring(matchIndex + matchedSubstring.length),
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          // Background image overlay
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/logo.png'), // Replace with your background image
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      // If the matched substring is not found, display the entire text as-is
      return Text(
        longText,
        style: TextStyle(color: Colors.black, fontSize: 16),
      );
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: TextWithBackground(),
  ));
}

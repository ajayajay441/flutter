import 'package:flutter/material.dart';

Widget buildFAB(scaffoldKey, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      FloatingActionButton(
        onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
        backgroundColor:
            const Color(0xFFA0642F), // Customize button color as needed
        foregroundColor: Colors.white, // Customize icon color as needed
        mini: true, // Make button smaller
        child: const Icon(Icons
            .menu_open), // Remove hero tag to prevent duplicate hero errors
      ),
      const SizedBox(height: 8), // Add some vertical space between buttons
      FloatingActionButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
          backgroundColor:
              const Color(0xFFA0642F), // Customize button color as needed
          foregroundColor: Colors.white, // Customize icon color as needed
          mini: true, // Make button smaller
          child: const Icon(
            Icons.menu_book_rounded,
          ) // Remove hero tag to prevent duplicate hero errors
          ),
    ],
  );
}

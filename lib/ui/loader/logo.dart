import 'package:flutter/material.dart';

Widget logo() {
  return Center(
    child: SizedBox(
      width: 50, // Set the desired width
      height: 50, // Set the desired height
      child: Image.asset(
        'assets/logo.png', // Replace 'your_image.png' with your image asset path
        fit: BoxFit.cover, // Adjust the fit as needed
      ),
    ),
  );
}

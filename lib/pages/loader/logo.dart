// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
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
}

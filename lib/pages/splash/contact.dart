// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      '+91-9902041477',
      style:
          TextStyle(fontFamily: 'Chathura', fontSize: 30, color: Colors.white),
    );
  }
}

import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  final String id;
  const BookPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hi'), // Use the title argument for the app bar title
      ),
      body: Center(
        child: Text('Index: $id'),
      ),
    );
  }
}

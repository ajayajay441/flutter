import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    // Extract values from the arguments
    final int index = args['index'];
    final String title = args['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title), // Use the title argument for the app bar title
      ),
      body: Center(
        child: Text('Index: $index'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:horeb_telugu_reference_bible/ui/common/book_page_app_bar.dart';
import 'package:horeb_telugu_reference_bible/ui/common/page_corner_bg_widget.dart';

class BookPage extends StatelessWidget {
  final String id;
  const BookPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          pageBackgroundImage(),
          // Page content
          Center(
            child: Container(
              width: double.infinity, // Width 100%
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookPageAppBar(id: id),
                    const Text('content goes here'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

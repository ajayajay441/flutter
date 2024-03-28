// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:horeb_telugu_reference_bible/ui/common/appbar.dart';
import 'package:horeb_telugu_reference_bible/ui/books/books_list.dart';
import 'package:horeb_telugu_reference_bible/ui/common/page_corner_bg.dart';

class BooksList extends StatelessWidget {
  const BooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
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
                child: const Center(
                  // Horizontally center content
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [CustomAppBar(), BooksListView()],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

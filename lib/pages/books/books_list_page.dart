import 'package:flutter/material.dart';
import 'package:horeb_telugu_reference_bible/ui/books/appbar_widget.dart';
import 'package:horeb_telugu_reference_bible/ui/books/books_list_widget.dart';
import 'package:horeb_telugu_reference_bible/ui/common/page_corner_bg_widget.dart';

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
                child: Center(
                  // Horizontally center content
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomAppBar(),
                      BooksListView(
                        onChildAction: (book) {
                          parentMethod(book, context);
                        }, // Pass the callback here
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Define the callback method here
  void parentMethod(dynamic book, BuildContext context) {
    var id = book["id"].toString();
    Navigator.pushNamed(
      context,
      '/book',
      arguments: {'id': id},
    );
  }
}

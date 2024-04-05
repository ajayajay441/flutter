// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horeb_telugu_reference_bible/pages/book/chapter_page.dart';
import 'package:horeb_telugu_reference_bible/ui/book/chapters_drawer.dart';
import 'package:horeb_telugu_reference_bible/ui/book/sidemenu_trigger.dart';
import 'package:horeb_telugu_reference_bible/ui/book/book_page_app_bar.dart';
import 'package:horeb_telugu_reference_bible/ui/common/page_corner_bg_widget.dart';

// ignore: must_be_immutable
class BookPage extends StatefulWidget {
  final int bookId;
  int chapterNumber;

  BookPage({
    super.key,
    required this.bookId,
    required this.chapterNumber,
  });

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic book;

  List<dynamic> books = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await rootBundle.loadString('assets/data/books.json');
      setState(() {
        books = jsonDecode(response);
        book = getBook(books, widget.bookId);
      });
    } catch (error) {
      // print("Error fetching data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F3F3),
      key: _scaffoldKey,
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
                    BookPageAppBar(
                        bookName: book?["name"] ?? 'Loading...',
                        selectedChapter: widget.chapterNumber),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                        child: ChapterPage(
                      bookId: widget.bookId,
                      chapterNumber: widget.chapterNumber,
                    )),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: buildFAB(_scaffoldKey, context),
      drawer: AppDrawer(
        book: book,
        selectedChapter: widget.chapterNumber,
        onChapterSelected: (chapter) {
          setState(() {
            widget.chapterNumber = chapter;
          });
          _scaffoldKey.currentState?.openEndDrawer();
        },
      ),
    );
  }

  Map<String, dynamic> getBook(books, int id) {
    for (var book in books) {
      if (book['id'] == id) {
        return book;
      }
    }
    return {}; // Return null if ID not found
  }
}

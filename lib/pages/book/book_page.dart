// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horeb_telugu_reference_bible/ui/book/sidemenu_trigger.dart';
import 'package:horeb_telugu_reference_bible/ui/common/book_page_app_bar.dart';
import 'package:horeb_telugu_reference_bible/ui/common/page_corner_bg_widget.dart';

class BookPage extends StatefulWidget {
  final int bookId;
  final int? chapter;

  const BookPage({super.key, required this.bookId, this.chapter = 1});

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedChapter = 1;
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
        print('bookName ${book["name"]}');
      });
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          pageBackgroundImage(),
          // Page content
          Center(
            child: Container(
              color: const Color(0xFFF4F3F3),
              width: double.infinity, // Width 100%
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookPageAppBar(bookName: book?["name"] ?? 'Loading...'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: buildFAB(_scaffoldKey, context),
      drawer: Drawer(
        backgroundColor: const Color(0xFFF4F3F3),
        child: Column(
          children: [
            DrawerHeader(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.only(left: 16.0),
              decoration: const BoxDecoration(
                color: Color(0xFFEEE4DB),
              ),
              child: Stack(fit: StackFit.expand, children: [
                pageBackgroundImage(),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${book?["name"] ?? "Loading..."}',
                          style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Chathura')),
                      Text('${book?["chapters"] ?? "0"} Chapters',
                          style: const TextStyle(
                              fontSize: 28, fontFamily: 'Chathura'))
                    ]),
              ]),
            ),
            // List
            Expanded(
              child: ListView.builder(
                itemCount: book?["chapters"] ?? 0, // Size of the array
                itemBuilder: (context, index) {
                  return ListTile(
                    selected: selectedChapter == index + 1,
                    selectedTileColor: const Color(0xFFA0642F),
                    selectedColor: selectedChapter == index + 1
                        ? Colors.white70
                        : Colors.black38,
                    tileColor: const Color(0xFFF4F3F3),
                    title: Text('${index + 1} వ అథ్యాయము',
                        style:
                            const TextStyle(fontFamily: 'JIMS', fontSize: 24)),
                    onTap: () {
                      setState(() {
                        selectedChapter = index + 1;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
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

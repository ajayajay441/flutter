// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horeb_telugu_reference_bible/ui/books/book_tile_widget.dart';

class BooksListView extends StatefulWidget {
  final void Function(dynamic) onChildAction; // Remove default value

  const BooksListView({super.key, required this.onChildAction});

  @override
  _BooksListViewState createState() => _BooksListViewState();
}

class _BooksListViewState extends State<BooksListView> {
  List<dynamic> books = [];
  List<dynamic> ot = [];
  List<dynamic> nt = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await rootBundle.loadString('assets/data/books.json');
    setState(() {
      books = jsonDecode(response);
      ot = books.sublist(0, 39);
      nt = books.sublist(39);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List<Widget>.generate(ot.length, (index) {
                  return BookTile(
                    book: ot[index],
                    callback: (msg) {
                      widget.onChildAction(msg); // Use callback from widget
                    },
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List<Widget>.generate(nt.length, (index) {
                  return BookTile(
                    book: nt[index],
                    callback: (book) {
                      widget.onChildAction(book); // Use callback from widget
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

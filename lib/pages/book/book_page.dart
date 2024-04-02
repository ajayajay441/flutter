// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:horeb_telugu_reference_bible/ui/book/sidemenu_trigger.dart';
import 'package:horeb_telugu_reference_bible/ui/common/book_page_app_bar.dart';
import 'package:horeb_telugu_reference_bible/ui/common/page_corner_bg_widget.dart';

class BookPage extends StatefulWidget {
  final String id;

  const BookPage({super.key, required this.id});

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // bool _isExpanded = false;

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
                    BookPageAppBar(id: widget.id),
                    Text(widget.id),
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
                const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Genesis',
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Chathura')),
                      Text('20 Chapters',
                          style:
                              TextStyle(fontSize: 28, fontFamily: 'Chathura'))
                    ]),
              ]),
            ),
            // List
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Size of the array
                itemBuilder: (context, index) {
                  return ListTile(
                    // tileColor: const Color(0xFFF4F3F3),
                    title: Text('Item ${index + 1}'),
                    onTap: () {
                      // Handle onTap for each ListTile
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
}

// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horeb_telugu_reference_bible/pages/book/chapter_page.dart';
import 'package:horeb_telugu_reference_bible/ui/book/chapters_drawer.dart';
import 'package:horeb_telugu_reference_bible/ui/book/sidemenu_trigger.dart';
import 'package:horeb_telugu_reference_bible/ui/common/book_page_app_bar.dart';
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
                      ),
                    ),
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


// // ignore_for_file: library_private_types_in_public_api

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:horeb_telugu_reference_bible/pages/book/chapter_page.dart';
// import 'package:horeb_telugu_reference_bible/ui/book/sidemenu_trigger.dart';
// import 'package:horeb_telugu_reference_bible/ui/common/book_page_app_bar.dart';
// import 'package:horeb_telugu_reference_bible/ui/common/page_corner_bg_widget.dart';

// class BookPage extends StatefulWidget {
//   final int bookId;
//   final int chapterNumber;

//   const BookPage(
//       {super.key, required this.bookId, required this.chapterNumber});

//   @override
//   _BookPageState createState() => _BookPageState();
// }

// class _BookPageState extends State<BookPage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   dynamic book;

//   List<dynamic> books = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     try {
//       final response = await rootBundle.loadString('assets/data/books.json');
//       setState(() {
//         books = jsonDecode(response);
//         book = getBook(books, widget.bookId);
//       });
//     } catch (error) {
//       // print("Error fetching data: $error");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Background image
//           pageBackgroundImage(),
//           // Page content
//           Center(
//             child: Container(
//               color: const Color(0xFFF4F3F3),
//               width: double.infinity, // Width 100%
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     BookPageAppBar(
//                         bookName: book?["name"] ?? 'Loading...',
//                         selectedChapter: widget.chapterNumber),
//                     const SizedBox(
//                       height: 16,
//                     ),
//                     Expanded(
//                       child: ChapterPage(
//                         bookId: widget.bookId,
//                         chapterNumber: widget.chapterNumber,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: buildFAB(_scaffoldKey, context),
//       drawer: Drawer(
//         backgroundColor: const Color(0xFFF4F3F3),
//         child: Column(
//           children: [
//             DrawerHeader(
//               margin: const EdgeInsets.all(0),
//               padding: const EdgeInsets.only(left: 16.0),
//               decoration: const BoxDecoration(
//                 color: Color(0xFFEEE4DB),
//               ),
//               child: Stack(fit: StackFit.expand, children: [
//                 pageBackgroundImage(),
//                 Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('${book?["name"] ?? "Loading..."}',
//                           style: const TextStyle(
//                               fontSize: 36,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Chathura')),
//                       Text('${book?["chapters"] ?? "0"} అథ్యాయములు',
//                           style: const TextStyle(
//                               fontSize: 24, fontFamily: 'Chathura'))
//                     ]),
//               ]),
//             ),
//             // List
//             Expanded(
//               child: Container(
//                   color: const Color(0xFFF4F3F3),
//                   height: double.infinity,
//                   child: ListView.builder(
//                     itemCount: book?["chapters"] ?? 0, // Size of the array
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         selected: widget.chapterNumber == index + 1,
//                         selectedColor: Colors.red,
//                         selectedTileColor: Colors.blueAccent,
//                         title: Text('${index + 1} వ అథ్యాయము',
//                             style: const TextStyle(
//                                 fontFamily: 'Mandali', fontSize: 18)),
//                         onTap: () {
//                           setState(() {
//                             _scaffoldKey.currentState?.closeDrawer();
//                             openChapter(widget.bookId, index + 1, context);
//                           });
//                         },
//                       );
//                     },
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Map<String, dynamic> getBook(books, int id) {
//     for (var book in books) {
//       if (book['id'] == id) {
//         return book;
//       }
//     }
//     return {}; // Return null if ID not found
//   }

//   // Define the callback method here
//   void openChapter(bookId, chapterNumber, BuildContext context) {
//     Navigator.pushNamed(
//       context,
//       '/book',
//       arguments: {'bookId': bookId, 'chapterNumber': chapterNumber},
//     );
//   }
// }

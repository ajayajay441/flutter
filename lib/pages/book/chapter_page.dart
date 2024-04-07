// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChapterPage extends StatefulWidget {
  final int bookId;
  final int chapterNumber;

  const ChapterPage({
    super.key,
    required this.bookId,
    required this.chapterNumber,
  });

  @override
  _ChapterPageState createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  List<dynamic> verses = [];
  int versesCount = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void didUpdateWidget(ChapterPage oldWidget) {
    if (widget.chapterNumber != oldWidget.chapterNumber) {
      // If the chapter number has changed, fetch data
      fetchData();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> fetchData() async {
    try {
      if (widget.chapterNumber == widget.chapterNumber) {
        final versesResponse =
            await rootBundle.loadString('assets/data/verses.json');
        setState(() {
          verses = getChapterData(jsonDecode(versesResponse),
              '${widget.bookId}-${widget.chapterNumber}-');
        });
      }
    } catch (error) {
      // print("Error fetching data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: verses.length, // Size of the array
      itemBuilder: (context, index) {
        return ListTile(
          tileColor: const Color.fromRGBO(
              0, 0, 0, 0), // Transparent background for ListTile
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SelectableText(
              '${index + 1}. ${verses[index]}',
              style: const TextStyle(
                fontFamily: 'Mandali',
                fontSize: 18,
                color: Color(0xFF100A05),
              ),
            ),
          ),
        );
      },
    );
  }

  List<dynamic> getChapterData(Map<String, dynamic> jsonData, String prefix) {
    final filteredData = <dynamic>[];
    jsonData.forEach((key, value) {
      if (key.startsWith(prefix)) {
        filteredData.add(value);
      }
    });
    return filteredData;
  }
}

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

  late String _selectedItem;
  bool _showOptions = false;

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
        return Column(children: [
          ListTile(
            tileColor: const Color.fromRGBO(
                0, 0, 0, 0), // Transparent background for ListTile
            title: SelectableText(
              '${index + 1}. ${verses[index]}',
              style: const TextStyle(
                fontFamily: 'Mandali',
                fontSize: 18,
                color: Color(0xFF100A05),
              ),
            ),
            onTap: () {
              setState(() {
                _selectedItem = verses[index];
                _showOptions = true; // Show options when item is tapped
              });
            },
          ),
          if (_showOptions)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Options for $_selectedItem:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text('Option 1'),
                  onTap: () {
                    // Perform action for Option 1
                  },
                ),
                ListTile(
                  title: Text('Option 2'),
                  onTap: () {
                    // Perform action for Option 2
                  },
                ),
              ],
            )
        ]);
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

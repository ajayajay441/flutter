// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class BookTile extends StatefulWidget {
  final VoidCallback onClick;
  final book;

  const BookTile({
    super.key,
    required this.book,
    required this.onClick,
  });

  @override
  _BookTileState createState() => _BookTileState();
}

class _BookTileState extends State<BookTile> {
  Color backgroundColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          backgroundColor = Colors.red; // Change background color on tap down
        });
      },
      onTapUp: (_) {
        setState(() {
          backgroundColor = Colors.blue; // Reset background color on tap up
        });
        widget.onClick(); // Call the click function
      },
      child: Container(
          width: double.infinity, // Width 100%
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(74, 58, 255, 0.06), // Shadow color
                  offset: Offset(0, 4), // Offset
                  blurRadius: 10, // Blur radius
                  spreadRadius: 0, // Spread radius
                ),
              ],
              border: Border.all(
                // Border
                color: const Color.fromRGBO(16, 10, 5, 0.12),
                width: 1.0,
              ) // Rounded corners
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.book['id'].toString(),
                    style:
                        const TextStyle(fontSize: 16, fontFamily: 'Chathura'),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${widget.book['shortName'] ?? widget.book['name']}',
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Chathura'),
                  )
                ],
              ),
              const SizedBox(height: 4), // Space between header and sub-header
              Text(
                '${widget.book['chapters'].toString()} అథ్యాయములు',
                style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF100A05),
                    fontFamily: 'Chathura'),
              )
            ],
          )),
    );
  }
}
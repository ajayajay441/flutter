import 'package:flutter/material.dart';

class BookPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String id;

  const BookPageAppBar({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: kToolbarHeight,
            elevation: 0,
            scrolledUnderElevation: 1,
            surfaceTintColor: Colors.transparent,
            leading: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color:
                    Color(0xFFE5D7CB), // Background color of the circular icon
              ),
              child: IconButton(
                icon: const Icon(Icons.chevron_left),
                color: const Color(0xFF263238), // Color of the back arrow icon
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )),
        AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: kToolbarHeight,
          elevation: 0,
          scrolledUnderElevation: 1,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading:
              false, // Set this to false to hide the back arrow icon
          centerTitle: false, // Set centerTitle to false
          title: Text(id,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Chathura')),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

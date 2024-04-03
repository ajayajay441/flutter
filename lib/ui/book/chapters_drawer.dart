import 'package:flutter/material.dart';
import 'package:horeb_telugu_reference_bible/ui/common/page_corner_bg_widget.dart';

class AppDrawer extends StatelessWidget {
  final dynamic book;
  final int selectedChapter;
  final Function(int) onChapterSelected;

  const AppDrawer({
    super.key,
    required this.book,
    required this.selectedChapter,
    required this.onChapterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    Text('${book["name"] ?? "Loading..."}',
                        style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Chathura')),
                    Text('${book["chapters"] ?? "0"} అథ్యాయములు',
                        style: const TextStyle(
                            fontSize: 24, fontFamily: 'Chathura'))
                  ]),
            ]),
          ),
          // List
          Expanded(
            child: ListView.builder(
              itemCount: book["chapters"] ?? 0, // Size of the array
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
                          const TextStyle(fontFamily: 'Mandali', fontSize: 18)),
                  onTap: () {
                    onChapterSelected(index + 1);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

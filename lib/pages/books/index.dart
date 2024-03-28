import 'package:flutter/material.dart';
import 'package:horeb_telugu_reference_bible/pages/book/index.dart';
import 'package:horeb_telugu_reference_bible/pages/books/books_list_page.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        print('settings.name ${settings.name}');
        switch (settings.name) {
          case '/':
            builder = (context) => const BooksList();
            break;
          case '/book':
            builder = (context) {
              final args = settings.arguments as Map<String, dynamic>;
              final id = args['id'] as String; // Extract ID from arguments
              return BookPage(id: id); // Pass ID to BookPage constructor
            };
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

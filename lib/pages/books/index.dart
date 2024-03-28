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
        switch (settings.name) {
          case '/':
            builder = (context) => const BooksList();
            break;
          case '/book/:id':
            builder = (context) => const Book();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

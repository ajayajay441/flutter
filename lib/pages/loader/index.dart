// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:horeb_telugu_reference_bible/pages/loader/bg_shape.dart';
import 'package:horeb_telugu_reference_bible/pages/loader/loader.dart';
import 'package:horeb_telugu_reference_bible/pages/loader/logo.dart';
import 'package:horeb_telugu_reference_bible/pages/splash/index.dart';
import 'package:horeb_telugu_reference_bible/ui/theme_data.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: appPrimarySwatch, // Use custom primary swatch
      ),
      home: const Scaffold(
          backgroundColor: Color(0xFFF4F3F3),
          body: Center(
            child: Stack(fit: StackFit.expand, children: [
              Background(),
              Loader(onLoadEnd: _onLoadEnd),
              Logo()
            ]),
          )),
    );
  }
}

_onLoadEnd() {
  runApp(const SplashPage());
}

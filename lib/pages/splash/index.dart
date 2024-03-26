// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:horeb_telugu_reference_bible/pages/splash/contact.dart';
import 'package:horeb_telugu_reference_bible/pages/splash/owner.dart';
import 'package:horeb_telugu_reference_bible/ui/navigation_tabs.dart';
import 'package:horeb_telugu_reference_bible/ui/theme_data.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      runApp(const MaterialApp(
        home: BottomNavBar(),
        debugShowCheckedModeBanner: false,
      ));
    });

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: appPrimarySwatch, // Use custom primary swatch
        ),
        home: Scaffold(
            backgroundColor: const Color(0xFFA0642F),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo_light.png',
                    width: 125,
                    height: 125,
                  ),
                  const Text(
                    'హోరేబు మినిస్ట్రీస్',
                    style: TextStyle(
                        fontFamily: 'Chathura',
                        fontSize: 32,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  const Owner(),
                  const Contact(),
                  const SizedBox(
                    height: 75,
                  ),
                  const Text(
                    'Version 2.0.0',
                    style: TextStyle(
                        fontFamily: 'Chathura',
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ],
              ),
            )));
  }
}

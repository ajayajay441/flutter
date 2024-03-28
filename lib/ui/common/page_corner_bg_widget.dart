import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget pageBackgroundImage() {
  return Positioned(
    top: -10,
    right: -10,
    child: SvgPicture.asset(
      'assets/page_corner.svg', // Replace 'background.svg' with your SVG image asset path
      // fit: BoxFit.cover,
    ),
  );
}

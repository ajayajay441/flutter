// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget background() {
  return SvgPicture.asset(
    'assets/loader_bg.svg',
    fit: BoxFit.fitWidth,
  );
}

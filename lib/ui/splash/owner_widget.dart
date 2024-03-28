import 'package:flutter/material.dart';

Widget owner() {
  return const Baseline(
      baseline: 0.0, // Adjust baseline value if needed
      baselineType: TextBaseline.alphabetic, // Specify baseline type
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Align children horizontally centered
        crossAxisAlignment: CrossAxisAlignment
            .baseline, // Align children vertically to baseline
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            'Rev.',
            style: TextStyle(
                fontFamily: 'Chathura', fontSize: 20, color: Colors.white),
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            'B.',
            style: TextStyle(
                fontFamily: 'Chathura',
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            'James Paul',
            style: TextStyle(
                fontFamily: 'Chathura',
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ],
      ));
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTexts{
  static TextStyle titleText = GoogleFonts.cabin(
                                         fontWeight: FontWeight.bold,
                                         fontSize: 25,
                                          );
  static TextStyle priceText = GoogleFonts.cabin(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static TextStyle discount = GoogleFonts.cabin(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.red[700]
  );
  static TextStyle bodyText = GoogleFonts.cabin(
      fontSize: 17,
  );
}
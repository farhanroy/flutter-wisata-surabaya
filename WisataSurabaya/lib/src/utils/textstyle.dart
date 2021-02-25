import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_extension.dart';

final TextStyle titleToolbarTextStyle = GoogleFonts.notoSans(
    fontSize: 21.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(
      color: Colors.black,
    ));

final TextStyle subTitleToolbarTextStyle = GoogleFonts.notoSans(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    textStyle: TextStyle(
      color: Colors.grey,
    ));

final TextStyle placeListName = GoogleFonts.notoSans(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(
      color: Colors.black87,
    ));
final TextStyle shortDescListName = GoogleFonts.notoSans(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(
      color: Colors.grey,
    ));
final TextStyle recommendListName = GoogleFonts.notoSans(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(
      color: Colors.black87,
    ));
final TextStyle descriptionPlace = GoogleFonts.notoSans(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    textStyle: TextStyle(
      wordSpacing: 5,
      letterSpacing: 1.5,
      color: Colors.grey,
    ));
final TextStyle retryButton = GoogleFonts.montserratSubrayada(
    fontSize: 18.0,
    textStyle: TextStyle(
      color: HexColor.fromHex("#11adcf"),
    ));
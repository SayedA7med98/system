import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme{

  static const Color mainColor = Color(0xff49768c);
  static const Color dark = Color(0xff7F7F7F);
  static const Color black = Color(0xff000000);
  static const Color light = Color(0xffFFFFFF);

  static TextStyle textStyle30 = GoogleFonts.montserrat().copyWith(
    fontWeight: FontWeight.w600,
    color: mainColor,
    fontSize: 30,
  );

  static TextStyle textStyle16 = GoogleFonts.montserrat().copyWith(
    fontWeight: FontWeight.w500,
    color: mainColor,
    fontSize: 16
  );

  static LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      mainColor.withValues(alpha: 0.6),
      mainColor.withValues(alpha: 0.48),
    ],
  );

  static  TextStyle hintTextStyle = GoogleFonts.montserrat().copyWith(
    fontWeight: FontWeight.w600,
    color: dark,
    fontSize: 16,
  );

}
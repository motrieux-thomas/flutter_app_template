import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextData {
  static TextTheme get getMainTheme => GoogleFonts.robotoTextTheme().copyWith(
        displayLarge: GoogleFonts.roboto(
          fontSize: 46,
          fontWeight: FontWeight.w900,
        ),
        displayMedium: GoogleFonts.roboto(
          fontSize: 36,
          fontWeight: FontWeight.w900,
        ),
        displaySmall: GoogleFonts.roboto(
          fontSize: 32,
          fontWeight: FontWeight.w900,
        ),
        headlineMedium: GoogleFonts.roboto(
          fontSize: 30,
          fontWeight: FontWeight.w900,
        ),
        headlineSmall: GoogleFonts.roboto(
          fontSize: 26,
          fontWeight: FontWeight.w900,
        ),
        titleLarge: GoogleFonts.roboto(
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        bodyLarge: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        bodyMedium: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        labelLarge: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: GoogleFonts.roboto(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      );

  static CupertinoTextThemeData get getCupertinoTheme => CupertinoTextThemeData(
        tabLabelTextStyle: GoogleFonts.roboto(
          fontSize: 9,
          fontWeight: FontWeight.w500,
        ),
      );
}

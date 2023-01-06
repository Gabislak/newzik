import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newzik/constants/app_colors.dart';

ThemeData myThemeData() {
  return ThemeData(
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.black),
      backgroundColor: MaterialStateProperty.all(primaryColor),
    )),
    dialogBackgroundColor: surfaceColor,
    appBarTheme: AppBarTheme(backgroundColor: surfaceColor),
    canvasColor: surfaceColor,
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(primaryColor),
      isAlwaysShown: true,
      showTrackOnHover: true,
    ),
    highlightColor: primaryColor,
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      headline1: GoogleFonts.robotoSlab(
          fontSize: 96,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
          color: highEmphasisTextOnSurface),
      headline2: GoogleFonts.robotoSlab(
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          color: highEmphasisTextOnSurface),
      headline3: GoogleFonts.robotoSlab(
          fontSize: 48,
          fontWeight: FontWeight.w400,
          color: highEmphasisTextOnSurface),
      headline4: GoogleFonts.robotoSlab(
          fontSize: 34,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: highEmphasisTextOnSurface),
      headline5: GoogleFonts.robotoSlab(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: highEmphasisTextOnSurface),
      headline6: GoogleFonts.robotoSlab(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: highEmphasisTextOnSurface),
      subtitle1: GoogleFonts.robotoSlab(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: mediumEmphasisTextOnSurface),
      subtitle2: GoogleFonts.robotoSlab(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: mediumEmphasisTextOnSurface),
      bodyText1: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: highEmphasisTextOnSurface),
      bodyText2: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: highEmphasisTextOnSurface),
      button: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          color: Colors.black),
      caption: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: mediumEmphasisTextOnSurface),
      overline: GoogleFonts.roboto(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: mediumEmphasisTextOnSurface),
    ),
  );
}

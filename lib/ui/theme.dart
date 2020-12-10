import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final darkTheme = ThemeData(
  textTheme: GoogleFonts.ubuntuTextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  primarySwatch: Colors.grey,
  primaryColor: Color(0xFF7A9BEE),
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: const Color(0xFF0097A7),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(foregroundColor: Colors.black),
  dividerColor: Colors.white,
);

final lightTheme = ThemeData(
  textTheme: GoogleFonts.ubuntuTextTheme().apply(
    bodyColor: Color(0xFF242461),
    displayColor: Color(0xFF242461),
  ),
  primarySwatch: Colors.blueGrey,
  primaryColor: Color(0xFF5353E0),
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFFCFCFC),
  accentColor: const Color(0xFFFFAC2F),
  highlightColor: Color(0xFFEEEEFC),
  splashColor: Color(0xFFEEEEFC),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(foregroundColor: Colors.deepOrange),
  dividerColor: Colors.black,
);

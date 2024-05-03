import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A class that provides the light and dark themes for the application.
class AppTheme {
  /// Private constructor to prevent instantiation.
  AppTheme._();

  /// The light theme for the application.
  ///
  /// This theme uses a white scaffold background, a white app bar with black icons,
  /// a blue primary color with white on top, a blue accent color, and the Lato font.
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Colors.blueAccent,
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );

  /// The dark theme for the application.
  ///
  /// This theme uses a black scaffold background, a black app bar with white icons,
  /// a blue primary color with black on top, a blue accent color, and the Lato font.
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      onPrimary: Colors.black,
      secondary: Colors.blueAccent,
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );
}

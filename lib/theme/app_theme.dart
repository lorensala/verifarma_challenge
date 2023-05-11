import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final fontFamily = GoogleFonts.poppins().fontFamily;

const primaryDark = Color(0xffE7FAB7);
const secondaryDark = Color(0xff282933);
const backgroundDark = Color(0xff15141A);
const onBackgroundDark = Colors.white;
const onSecondaryDark = Color(0xff636371);
const errorDark = Color(0xffFAB7B7);

const primaryLight = Color(0xff403EED);
const secondaryLight = Color(0xffF2F4F5);
const backgroundLight = Colors.white;
const onBackgroundLight = Colors.black;
const onSecondaryLight = Color(0xff999DA7);
const errorLight = Color(0xffFC7171);

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      primaryColor: primaryLight,
      scaffoldBackgroundColor: backgroundLight,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: onBackgroundLight,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        backgroundColor: backgroundLight,
        elevation: 0,
      ),
      textTheme: _textTheme(onBackgroundLight),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryLight,
        backgroundColor: backgroundLight,
        unselectedItemColor: onSecondaryLight,
        selectedLabelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(fontFamily: fontFamily, fontSize: 12),
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: primaryLight,
        secondary: secondaryLight,
        background: backgroundLight,
        onBackground: onBackgroundLight,
        onSecondary: onSecondaryLight,
        error: errorLight,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: primaryDark,
      scaffoldBackgroundColor: backgroundDark,
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundDark,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: onBackgroundDark,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
      ),
      textTheme: _textTheme(onBackgroundDark),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryDark,
        backgroundColor: backgroundDark,
        unselectedItemColor: onSecondaryDark,
        selectedLabelStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(fontFamily: fontFamily, fontSize: 12),
      ),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: primaryDark,
        secondary: secondaryDark,
        background: backgroundDark,
        onBackground: onBackgroundDark,
        onSecondary: onSecondaryDark,
        error: errorDark,
      ),
    );
  }
}

TextTheme _textTheme(Color color) {
  return TextTheme(
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 57,
      color: color,
    ),
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 45,
      color: color,
    ),
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 36,
      color: color,
    ),
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 32,
      color: color,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 28,
      color: color,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 24,
      color: color,
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 22,
      color: color,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: color,
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: color,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: color,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: color,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 11,
      color: color,
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: color,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: color,
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: color,
    ),
  );
}

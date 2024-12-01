import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes{

  /// Main color pallete
  static const cEEEEEE = Color(0xFFEEEEEE);
  static const cD4EBF8 = Color(0xFFD4EBF8);
  static const c1F509A = Color(0xFF1F509A);
  static const c0A3981 = Color(0xFF0A3981);
  static const cE38E49 = Color(0xFFE38E49);
  static const black252525 = Color(0xFF252525);

  /// Override defaultTheme
  static ThemeData defaultTheme(BuildContext context){

    var baseTheme = ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      primaryColor: c0A3981,
      appBarTheme: const AppBarTheme(
        backgroundColor: c1F509A,
        foregroundColor: Colors.white,
        surfaceTintColor: c1F509A,
        iconTheme: IconThemeData(color: c0A3981),
        elevation: 0.0,
        centerTitle: false,
        toolbarHeight: 60.0,

      ),
      scaffoldBackgroundColor: Colors.white,
      // fontFamily: 'Roboto',
      tabBarTheme: const TabBarTheme(
        labelColor: c0A3981,
      ),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.aBeeZeeTextTheme(baseTheme.textTheme)
    );
  }

}
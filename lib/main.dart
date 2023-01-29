import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_api_backend/src/constant/colors.dart';
import 'package:quiz_app_api_backend/src/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: yellow),
        fontFamily: GoogleFonts.allerta().fontFamily,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: yellow,
          ),
          headline5: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
            color: yellow,
          ),
          headline6: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            color: deepPurple,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

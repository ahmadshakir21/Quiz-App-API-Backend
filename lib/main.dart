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
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: yellow),
          fontFamily: GoogleFonts.allerta().fontFamily),
      home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app_api_backend/src/constant/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [purple, deepPurple])),
        child: Column(
          children: [Image.asset("assets/images/4119038.jpg")],
        ),
      ),
    ));
  }
}

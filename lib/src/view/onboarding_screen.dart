import 'package:flutter/material.dart';
import 'package:quiz_app_api_backend/src/constant/colors.dart';
import 'package:quiz_app_api_backend/src/view/quiz_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: width * 0.75,
              height: height * 0.75,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset("assets/images/4119038.png"),
            ),
            Container(
              width: width * 0.75,
              height: height * 0.05,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => QuizScreen(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: deepPurple,
                  ),
                  child: Text(
                    "Go to Q&A Screen",
                    style: Theme.of(context).textTheme.headline6,
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}

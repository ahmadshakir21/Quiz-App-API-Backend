import 'package:flutter/material.dart';
import 'package:quiz_app_api_backend/src/constant/colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
                width: width * 0.75,
                height: height * 0.75,
                child: Image.asset("assets/images/4119038.png")),
            Text(
              "Welcome to Quiz App",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width * 0.75,
              height: height * 0.05,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: purple,
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

import 'package:flutter/material.dart';
import 'package:quiz_app_api_backend/src/constant/colors.dart';
import 'package:quiz_app_api_backend/src/model/quiz_model.dart';
import 'package:quiz_app_api_backend/src/service/api_service.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  PageController? controller = PageController(initialPage: 0);
  ApiService apiService = ApiService();
  var optionList = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<QuizModel>(
                future: apiService.fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).progressIndicatorTheme.color,
                      ),
                    );
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text("No Data"));
                  } else if (snapshot.hasData) {}
                  return const Center(
                    child: Text("o"),
                  );
                },
              ),
            ],
          ),
          // child: Column(children: [
          //   PageView.builder(
          //     controller: controller!,
          //     physics: const NeverScrollableScrollPhysics(),
          //     // itemCount: ,
          //     itemBuilder: (context, index) => Container(
          //       width: width * 0.9,
          //       height: height * 0.7,
          //       padding: const EdgeInsets.all(10),
          //       color: Colors.black26,
          //       child: FutureBuilder<QuizModel>(
          //         future: apiService.fetchData(),
          //         builder: (BuildContext context, AsyncSnapshot snapshot) {
          //            else if (snapshot.hasData) {
          //             return Column(
          //               children: [
          //                 const SizedBox(
          //                   height: 15,
          //                 ),
          //                 //TODO: MODIFY 1/20
          //                 Text("Question 1/20"),
          //                 const SizedBox(
          //                   height: 30,
          //                 ),
          //                 ListView.builder(
          //                   shrinkWrap: true,
          //                   itemCount: 4,
          //                   itemBuilder: (context, index) {
          //                     return Container(
          //                       height: height * 0.07,
          //                       padding: const EdgeInsets.all(10),
          //                       margin: const EdgeInsets.only(bottom: 20),
          //                       decoration: BoxDecoration(
          //                           color: deepPurple,
          //                           borderRadius: BorderRadius.circular(12)),
          //                       child: Center(
          //                         child: Text(
          //                           "Answer",
          //                           style:
          //                               Theme.of(context).textTheme.headline6,
          //                         ),
          //                       ),
          //                     );
          //                   },
          //                 ),
          //               ],
          //             );
          //           }
          //           return Center(
          //             child: CircularProgressIndicator(
          //               color: Theme.of(context).progressIndicatorTheme.color,
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //   ),
          // ]),
          // ),
        ),
      ),
    ));
  }
}

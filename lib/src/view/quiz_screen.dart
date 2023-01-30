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
  var isLoaded = false;
  var currentQuestionIndex = 0;
  var optionColor = [yellow, yellow, yellow, yellow];

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
                  } else if (snapshot.hasData) {
                    var data = snapshot.data!.results;

                    if (isLoaded == false) {
                      optionList = data[currentQuestionIndex].incorrect_answers;
                      optionList.add(data[currentQuestionIndex].correct_answer);
                      optionList.shuffle();
                      isLoaded = true;
                    }

                    return Container(
                      width: width * 0.9,
                      height: height * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Question ${currentQuestionIndex + 1} / ${data.length}",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          const Divider(
                            color: deepPurple,
                            thickness: 1.5,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            data[currentQuestionIndex].question,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ListView.builder(
                            itemCount: optionList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var answer =
                                  data[currentQuestionIndex].correct_answer;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (answer.toString() ==
                                        optionList[index].toString()) {
                                      optionColor[index] = green;
                                    } else {
                                      optionColor[index] == lightRed;
                                    }

                                    if (currentQuestionIndex < data.length) {
                                      Future.delayed(
                                        const Duration(seconds: 1),
                                        () => currentQuestionIndex++,
                                      );
                                    }
                                  });
                                },
                                child: Container(
                                  width: width * 0.9,
                                  height: height * 0.08,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(
                                      color: optionColor[index],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    optionList[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: deepPurple),
                                  )),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(
                    child: Text(""),
                  );
                },
              ),
            ],
          ),
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

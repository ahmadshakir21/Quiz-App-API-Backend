import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:quiz_app_api_backend/src/model/quiz_model.dart';

class ApiService {
  // This is our api =====> https://opentdb.com/api.php?amount=25&category=18&difficulty=medium&type=multiple

  Future<QuizModel> fetchData() async {
    // final String apiLink =
    //     "https://opentdb.com/api.php?amount=25&category=18&difficulty=medium&type=multiple";

    Uri quizAppUri = Uri(
        scheme: 'https',
        host: 'opentdb.com',
        path: 'api.php',
        queryParameters: {
          'amount': '25',
          'category': '18',
          'difficulty': 'medium',
          'type': 'multiple'
        });

    https.Response response = await https.get(quizAppUri).catchError((error) {
      print(error);
    });

    // List result = json.decode(response.body);
    // List<QuizModel> quizModelList =
    //     result.map((e) => QuizModel.fromJson(e)).toList();

    QuizModel quizModel = QuizModel.fromJson(response.body);

    if (response.statusCode == 200) {
      return quizModel;
    } else {
      throw 'Error';
    }
  }
}

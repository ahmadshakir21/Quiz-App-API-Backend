import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuizModel {
  final int response_code;
  final List<Result> results;
  QuizModel({
    required this.response_code,
    required this.results,
  });

  QuizModel copyWith({
    int? response_code,
    List<Result>? results,
  }) {
    return QuizModel(
      response_code: response_code ?? this.response_code,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'response_code': response_code,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      response_code: map['response_code'].toInt() as int,
      results: List<Result>.from(
        (map['results'] as List<dynamic>).map<Result>(
          (x) => Result.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuizModel(response_code: $response_code, results: $results)';

  @override
  bool operator ==(covariant QuizModel other) {
    if (identical(this, other)) return true;

    return other.response_code == response_code &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode => response_code.hashCode ^ results.hashCode;
}

class Result {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correct_answer;
  final List<String> incorrect_answers;
  Result({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correct_answer,
    required this.incorrect_answers,
  });

  Result copyWith({
    String? category,
    String? type,
    String? difficulty,
    String? question,
    String? correct_answer,
    List<String>? incorrect_answers,
  }) {
    return Result(
      category: category ?? this.category,
      type: type ?? this.type,
      difficulty: difficulty ?? this.difficulty,
      question: question ?? this.question,
      correct_answer: correct_answer ?? this.correct_answer,
      incorrect_answers: incorrect_answers ?? this.incorrect_answers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'type': type,
      'difficulty': difficulty,
      'question': question,
      'correct_answer': correct_answer,
      'incorrect_answers': incorrect_answers,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
        category: map['category'] as String,
        type: map['type'] as String,
        difficulty: map['difficulty'] as String,
        question: map['question'] as String,
        correct_answer: map['correct_answer'] as String,
        incorrect_answers: List<String>.from(
          (map['incorrect_answers'] as List<dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) =>
      Result.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Result(category: $category, type: $type, difficulty: $difficulty, question: $question, correct_answer: $correct_answer, incorrect_answers: $incorrect_answers)';
  }

  @override
  bool operator ==(covariant Result other) {
    if (identical(this, other)) return true;

    return other.category == category &&
        other.type == type &&
        other.difficulty == difficulty &&
        other.question == question &&
        other.correct_answer == correct_answer &&
        listEquals(other.incorrect_answers, incorrect_answers);
  }

  @override
  int get hashCode {
    return category.hashCode ^
        type.hashCode ^
        difficulty.hashCode ^
        question.hashCode ^
        correct_answer.hashCode ^
        incorrect_answers.hashCode;
  }
}

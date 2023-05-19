import 'package:teach_me/models/answer.dart';

class Question {
  final String title;
  final List<Answer> answers;

  Question({required this.title, required this.answers});

  factory Question.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw Exception('Failed to decode Question from JSON');
    }
    List<Answer> answer = [];
    for (int i = 0; i < json['answer'].length; i++) {
      answer.add(Answer.fromJson(json['answer'][i]));
    }
    return Question(
      title: json['title'] as String,
      answers: answer,
    );
  }
}

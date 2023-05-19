class Answer {
  final String answerText;
  final bool isRight;

  Answer({
    required this.answerText,
    required this.isRight,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      answerText: json['answer_text'] as String,
      isRight: json['is_right'] as bool,
    );
  }
}

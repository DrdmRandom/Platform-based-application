class QuizController {
  final List<Map<String, dynamic>> questions;
  final List<String> correctAnswers;
  List<String> userAnswers;

  QuizController({
    required this.questions,
    required this.correctAnswers,
  }) : userAnswers = List.filled(questions.length, '');

  void setUserAnswer(int questionIndex, String answer) {
    userAnswers[questionIndex] = answer;
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < correctAnswers.length; i++) {
      if (userAnswers[i] == correctAnswers[i]) {
        score++;
      }
    }
    return score;
  }
}

import 'package:quiz_game/data/models/question_modell.dart';

class QuizModell {
  static List<QuestionModell> listeQuestions = List.empty(growable: true);
  static int index = 0;

  static String getQuestion() {
    return listeQuestions[index].getQuestionText();
  }

  static String getImage() {
    return listeQuestions[index].getQuestionImage();
  }

  static String getTheme() {
    return listeQuestions[index].getThemeImage();
  }

  static bool getReponse() {
    return listeQuestions[index].getReponseQuestion();
  }

  static void nextQuestion() {
    if (index < listeQuestions.length - 1) {
      index++;
    }
  }

  static bool isFinished() {
    if (index >= listeQuestions.length - 1)
      return true;
    else
      return false;
  }

  static void restart() {
    index = 0;
  }
}

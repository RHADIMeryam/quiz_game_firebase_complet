class QuestionModell {
  String questionText = "";
  String questionImage = "";
  bool isCorrect = false;
  String theme = "";

  QuestionModell(
      {required this.questionText,
      required this.questionImage,
      required this.isCorrect,
      required this.theme});

  String getThemeImage() {
    return theme;
  }

  void setTheme(String t) {
    theme = t;
  }

  String getQuestionText() {
    return questionText;
  }

  void setQuestionText(String qT) {
    questionText = qT;
  }

  String getQuestionImage() {
    return questionImage;
  }

  void setQuestionImage(String qI) {
    questionImage = qI;
  }

  bool getReponseQuestion() {
    return isCorrect;
  }

  void setReponse(bool r) {
    isCorrect = r;
  }
}

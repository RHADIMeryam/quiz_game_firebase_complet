import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quiz_game/business_logic/cubit/state_cubit.dart';
import 'package:quiz_game/data/models/quiz_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizCubit extends Cubit<QuizState> {
  int index = 0;
  int score = 0;

  QuizCubit(this.index, this.score) : super(QuizInitial(0, 0));

  void checkAnswer(bool userChoice, BuildContext context) {
    if (QuizModell.isFinished() == true) {
      Alert(
        context: context,
        title: 'Bravo !',
        desc: 'Votre score est ' + score.toString(),
      ).show();
      QuizModell.restart();
      emit(QuizInitial(index, score));
      score = 0;
    } else {
      if (QuizModell.getReponse() == userChoice) {
        score = score + 10;
        QuizModell.nextQuestion();
        emit(QuizInitial(index, score));
      } else {
        QuizModell.nextQuestion();
        emit(QuizInitial(index, score));
      }
    }
  }

  void checkAnswerNext(BuildContext context) {
    if (QuizModell.isFinished() == true) {
      Alert(
        context: context,
        title: 'Bravo !',
        desc: 'Votre score est : ' + score.toString(),
      ).show();
      QuizModell.restart();
      emit(QuizInitial(index, score));
      index = 0;
    } else {
      QuizModell.nextQuestion();
      emit(QuizInitial(index, score));
    }
  }
}

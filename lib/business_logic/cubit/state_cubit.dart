import 'package:flutter/material.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {
  int index = 0;
  int score = 0;

  QuizInitial(this.index, this.score);
}

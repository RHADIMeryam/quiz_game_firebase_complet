import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_game/data/models/question_modell.dart';
import 'package:quiz_game/data/models/quiz_model.dart';
import 'package:quiz_game/data/repositories/question_repositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_game/presentation/widgets/ajouter_question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DBconnect {
  static QuestionRepository ref = new QuestionRepository();
  static int index = 0;

  //final url = Uri.parse('');
  static CollectionReference ref2 =
      FirebaseFirestore.instance.collection('listeQuestion');

  //enregister nouveau quetsion
  static Future<void> getQuestionSync() async {
    QuerySnapshot query = await ref2.get();
    List<QueryDocumentSnapshot> docs = query.docs;
    for (var doc in docs) {
      if (doc.data() != null) {
        var data = doc.data() as Map<String, dynamic>;
        QuizModell.listeQuestions.add(QuestionModell(
            questionText: data['question'],
            isCorrect: data['reponse'],
            questionImage: data['image'],
            theme: data['theme']));
      }
    }
  }

  static Future<void> addQuestions(BuildContext context) {
    return ref2
        .add({
          'question': questionController.text,
          'reponse': stringToBool(reponseController.text),
          'image': imageController.text,
          'theme': themeController.text
        })
        .then((value) => Alert(
              context: context,
              title: 'Question ajouté',
              desc: 'Cliquer sur retour !',
            ).show())
        .catchError((error) => print("Erreur : $error"));
  }
}

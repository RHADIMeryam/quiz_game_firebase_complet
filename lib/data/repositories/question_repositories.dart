import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionRepository {
  var firebase = FirebaseFirestore.instance.collection("listeQuestion");

  Future<DocumentReference> addQuestion(Map<String, dynamic> question) {
    return firebase.add(question);
  }
}

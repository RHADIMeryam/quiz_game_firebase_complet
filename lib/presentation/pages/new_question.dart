import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/ajouter_question.dart';

class NewQuestion extends StatelessWidget {
  const NewQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Quiz"),
      ),
      body: Center(
        child: ajouterQuestion(context),
      ),
    );
  }
}

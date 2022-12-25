import 'package:flutter/material.dart';
import 'package:quiz_game/data/data_providers/db_connect.dart';

TextEditingController questionController = TextEditingController();
TextEditingController reponseController = TextEditingController();
TextEditingController imageController = TextEditingController();
TextEditingController themeController = TextEditingController();

bool stringToBool(String val) {
  bool res;
  if (val.toLowerCase() == "true") {
    res = true;
  } else {
    res = false;
  }
  return res;
}

Widget ajouterQuestion(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 20,
        ),
        Container(
          child: Text("Ajouter une question  : ",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
        ),
        Container(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: questionController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Ecrivez votre question ',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: reponseController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Reponse de votre question : True/False',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: themeController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Choisisez votre thème',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: imageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Saisir url de votre image',
            ),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  DBconnect.addQuestions(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Envoyer",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
              Container(
                width: 20,
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "retour",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
            ],
          ),
        ),
      ],
    ),
  );
}

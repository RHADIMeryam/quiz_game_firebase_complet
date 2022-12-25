import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:quiz_game/data/data_providers/db_connect.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_game/business_logic/cubit/quiz_cubit.dart';
import 'package:quiz_game/data/models/quiz_model.dart';
import '../../business_logic/cubit/state_cubit.dart';
import 'new_question.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DBconnect.getQuestionSync();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(0, 0),
      child: BlocBuilder<QuizCubit, QuizState>(
        builder: (_, theme) {
          return MaterialApp(
            title: 'Quiz',
            theme: ThemeData(
              primarySwatch: Colors.purple,
            ),
            home: QuizzPage(),
          );
        },
      ),
    );
  }
}

class QuizzPage extends StatefulWidget {
  @override
  QuizzPageState createState() => QuizzPageState();
}

class QuizzPageState extends State<QuizzPage> {
  int score = 0;
  int index = 0;
  QuizModell quizzQuestion = QuizModell();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Theme : ",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Text("${QuizModell.getTheme()}",
                            style: const TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        Container(
                          height: 40,
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                height: 250,
                child: Image.network('${QuizModell.getImage()}'),

              ),
              Container(
                height: 40,
              ),
              Text(QuizModell.getQuestion(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Container(
                height: 30,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        context.read<QuizCubit>().checkAnswer(true, context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Vrai",
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
                        context.read<QuizCubit>().checkAnswer(false, context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Faux",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                height: 40,
              ),
              Container(
                  child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewQuestion()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Ajouter question",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

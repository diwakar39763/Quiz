import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
   List<String> selectedAnswer = [];

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if(selectedAnswer.length==questions.length){
      setState(
      () {
        activeScreen = "result_screen";
      },
    );
    }
  }

  // Widget? activeScreen ;
  // @override
  // void initState() {
  //   activeScreen =  StartScreen(switchScreen);
  //   super.initState();
  // }
  var activeScreen = "start_screen";
  void switchScreen() {
    setState(
      () {
        activeScreen = "question_screen";
      },
    );
  }


  void restartScreen(){
    setState(() {
      activeScreen="restart_screen";
    });
  }

  @override
  Widget build(context) {
    // Widget screenWidge=activeScreen == "switch_screen"?
    //         StartScreen(switchScreen)
    //         :const QuestionScreen();

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "question_screen") {
      screenWidget =  QuestionScreen(onSelectAnswer:chooseAnswer);
    }
    if(activeScreen=="result_screen"){
      screenWidget=  ResultScreen(choosenAnswer:selectedAnswer,restartScreen: restartScreen,);
    }
    if(activeScreen=="restart_screen"){
      selectedAnswer = [];
      screenWidget=StartScreen(switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 39, 9, 137),
              Color.fromARGB(255, 9, 96, 137)
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

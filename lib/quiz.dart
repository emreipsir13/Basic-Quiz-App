import 'package:flutter/material.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(
      () {
        activeScreen = 'questions-screen';
      },
    );
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(
        () {
          activeScreen = 'result-screen';
        },
      );
    }
    if (activeScreen == 'result-screen') {}
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget =
          ResultScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 255, 170),
                Color.fromARGB(255, 3, 205, 255)
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'questions_screen.dart';
import 'results_screen.dart';
import 'data/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';
  List<String> selectedAnswers = [];
  int currentQuestionIndex = 0;

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      // All questions answered → go to results
      setState(() {
        activeScreen = 'results-screen';
      });
    } else {
      // Continue with next question
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      currentQuestionIndex = 0;
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
        currentQuestionIndex: currentQuestionIndex,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0A1034), // Dark blue
                Color(0xFF1B2459), // Champions League purple
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

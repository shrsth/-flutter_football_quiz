import 'package:flutter/material.dart';
import 'data/question.dart';
import 'answer_button.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
    required this.currentQuestionIndex,
  });

  final void Function(String answer) onSelectAnswer;
  final int currentQuestionIndex;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...currentQuestion.answers.map(
            (answer) => AnswerButton(
              answerText: answer,
              onTap: () => onSelectAnswer(answer),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'question_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
      (data) {
        return data['user_answer'] == data['question_answer'];
      },
    ).length;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '$numTotalQuestions adet sorudan $numCorrectQuestions adet doğru cevapladın!'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            TextButton(
              onPressed: onRestart,
              child: const Text('Sinavi Tekrarla'),
            ),
          ],
        ),
      ),
    );
  }
}

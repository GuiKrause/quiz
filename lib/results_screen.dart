import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(
      {super.key, required this.awnseredQuestions, required this.restartQuiz});

  final List<String> awnseredQuestions;
  final void Function() restartQuiz;
  final List<Map<String, Object>> summary = [];

  List<Map<String, Object>> getSummaryData() {
    for (var i = 0; i < awnseredQuestions.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_awnser': questions[i].awnsers[0],
          'user_awnser': awnseredQuestions[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You awnsered X out of Y questions correctly'),
            const SizedBox(
              height: 30,
            ),
            const Text('List of Awnsers and Questions'),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: restartQuiz,
              child: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}

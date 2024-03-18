import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_summary.dart';

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
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAwnsers = summaryData.where((data) {
      return data['user_awnser'] == data['correct_awnser'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You awnsered $numCorrectAwnsers out of $numTotalQuestions questions correctly',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 208, 170, 255),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: restartQuiz,
              style: OutlinedButton.styleFrom(
                shape: const ContinuousRectangleBorder(),
                side: const BorderSide(style: BorderStyle.none)
              ),
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

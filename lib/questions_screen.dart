import 'package:flutter/material.dart';
import 'package:quiz/awnser_button.dart';
import 'package:quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAwnser});

  final void Function(String awnser) onSelectAwnser;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentAwnserQuestion = 0;

  void awnserQuestion(String selectedAwnser) {
    widget.onSelectAwnser(selectedAwnser);
    setState(() {
      currentAwnserQuestion++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentAwnserQuestion];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 208, 170, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledList().map((awnser) {
              return AwnserButton(
                awnserText: awnser,
                onTap: () {
                  awnserQuestion(awnser);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  final List<String> selectedAwnsers = [];
  var activeScreen = 'start-screen';

  // This commented code below it's another
  // aproach to render other screen using
  // the initState() metod. It's kind verbose
  // and use life cicle methods.  

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }

  void chooseAwnser(String awnser) {
    selectedAwnsers.add(awnser);
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }
  

  @override
  Widget build(context) {

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAwnser: chooseAwnser);
    }

    return MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 122, 17, 221),
        ),
        child: screenWidget,
      ),
    ),
  );
  }
}
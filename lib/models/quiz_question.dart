class QuizQuestion {
  QuizQuestion(this.text, this.awnsers);

  final String text;
  final List<String> awnsers;

  List<String> getShuffledList() {
    final shuffledList = List.of(awnsers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
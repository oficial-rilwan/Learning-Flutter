import 'package:flutter/material.dart';
import 'package:flutter_application_1/quiz/data/questions.dart';
import 'package:flutter_application_1/quiz/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.selectedAnswers,
    required this.restartQuiz,
  });

  final List<String> selectedAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
        'is_correct': selectedAnswers[i] == questions[i].answers[0],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestion =
        summaryData.where((item) {
          return item['correct_answer'] == item['user_answer'];
        }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answerd $numCorrectQuestion out of $numTotalQuestions  questions correctly!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 173, 146, 246),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30),
            QuestionSummary(summaryData),
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: restartQuiz,
              label: Text("Restart Quiz!"),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: Icon(Icons.replay_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'questions': questions[i].questions,
        'correct_answers': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  final List<String> chosenAnswers;

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answers'])
        .length;
    final isCorrectAnswer = summaryData
        .where((data) => data['user_answer'] == data['correct_answers']);

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            style: const TextStyle(
              color: Color.fromARGB(255, 231, 176, 236),
              fontSize: 19,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          QuestionSummary(
            summaryData,
            isCorrectAnswer.toList(),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: onRestart,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.refresh_outlined,
                  color: Color.fromARGB(150, 246, 238, 247),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Restart Questions',
                  style: TextStyle(
                    color: Color.fromARGB(150, 246, 238, 247),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

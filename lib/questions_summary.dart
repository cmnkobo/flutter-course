import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, this.isCorrectAnswer, {super.key});

  final List<Map<String, Object>> summaryData;

  final List<Map<String, Object>> isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = ['user_answer'] == ['correct_answers'];
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (data) => Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          isCorrectAnswer ? Colors.blue : Colors.purple,
                      radius: 15,
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['questions'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data['user_answer'] as String,
                              style: const TextStyle(
                                color: Colors.purple,
                              ),
                            ),
                            Text(
                              data['correct_answers'] as String,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 102, 141, 174),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

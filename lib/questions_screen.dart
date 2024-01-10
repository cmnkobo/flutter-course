import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSCreen extends StatefulWidget {
  const QuestionSCreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionSCreen> createState() => _QuestionSCreenState();
}

class _QuestionSCreenState extends State<QuestionSCreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      // currentQuestionIndex = currentQuestionIndex + 1; or
      // // currentQuestionIndex += 1; or
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.questions,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 210, 184, 217),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ...currentQuestion.getShuffledAnswers().map((answers) {
            return AnswerButton(
                answerText: answers,
                onTap: () {
                  answerQuestion(answers);
                });
          })
        ],
      ),
    );
  }
}

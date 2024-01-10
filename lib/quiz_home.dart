import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizHome extends StatelessWidget {
  const QuizHome(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          'Learn Flutter the Fun way!',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 126, 122, 122),
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.grey,
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
        )
      ],
    );
  }
}

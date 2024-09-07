import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.7,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              height: 250,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Quiz Uygulamasına Hoş Geldin!',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Opacity(
            opacity: 1,
            child: OutlinedButton(
              onPressed: () {
                startQuiz();
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 231, 231, 231)),
              child: const Text(
                'Quizi Başlat',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

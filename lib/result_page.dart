// result_page.dart
import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_question.dart';


class ResultPage extends StatelessWidget {

  final int correctAnswersCount;
  final List<QuizQuestion> questions;
  final List<String> userAnswers;

  const ResultPage({super.key,
    required this.correctAnswersCount,
    required this.questions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 119, 54, 219),
            Color.fromARGB(255, 209, 0, 255),
            Color.fromARGB(255, 250, 68, 68),
          ])
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            Text(
              'You answered $correctAnswersCount out of ${questions.length} questions correctly!',
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  final userAnswer = userAnswers[index];
                  final correctAnswer = question.answers[0]; // Assuming the first answer is the correct one

                  return ListTile(
                    title: Text(question.text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),

                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your answer: $userAnswer',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text('Correct answer: $correctAnswer',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

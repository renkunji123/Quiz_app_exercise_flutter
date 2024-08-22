import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_page.dart';
import 'answer_button.dart';

class QuizPage extends StatefulWidget {
 const QuizPage({super.key});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  final List<String> _userAnswer = [];
  int _correctAnswerCount = 0;
  void _answerQuestion(String selectedAnswer){
    setState(() {
      _userAnswer.add(selectedAnswer);
      if (selectedAnswer == questions[_currentQuestionIndex].answers[0]){
        _correctAnswerCount++;
      }
      if (_currentQuestionIndex < questions.length - 1 ){
        _currentQuestionIndex++;
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ResultPage(
              correctAnswersCount: _correctAnswerCount,
              questions: questions,
              userAnswers: _userAnswer,
            ),
          ),
        );
      }
    });
  }
  @override
    Widget build(context) {

    final currentQuestion = questions[_currentQuestionIndex];
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 119, 54, 219),
          Color.fromARGB(255, 209, 0, 255),
          Color.fromARGB(255, 250, 68, 68),
        ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
                currentQuestion.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                ),
              ),
          ),
            const SizedBox(height: 20),
            ...currentQuestion.answers.map((answer) {
              return AnswerButton (
                answerText: answer,
                onTap: () => _answerQuestion(answer),
              );
            }),

        ],
      ),
    );
  }
}

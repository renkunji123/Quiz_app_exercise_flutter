import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_page.dart';


class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  void startQuiz(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QuizPage())
    );
  }
  @override
  Widget build(context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 119, 54, 219),
              Color.fromARGB(255, 209, 0, 255),
              Color.fromARGB(255, 250, 68, 68),
            ]),
        ),
      
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/quiz-logo.png",
              width: 300,
              color: const Color.fromARGB(200, 255, 255, 255), // 200 là chỉ số a dùng để làm mờ
            ),



            const SizedBox(height: 70,),

            const Text('Learn FLutter by the fun way!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20,),

            OutlinedButton.icon(
              onPressed: () => startQuiz(context),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 20,
                )
              ),
              label:  const Text('Start Quiz'),
              icon: const Icon(Icons.arrow_forward_ios_sharp),
            )
          ],
        ),
      ),
    );
  }
}
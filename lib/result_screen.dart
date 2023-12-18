import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswer, required this.restartScreen});

  final List<String> choosenAnswer;
  final void Function() restartScreen;
  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          "questionIndex": i,
          "question": questions[i].text,
          "correct_answer": questions[i].answers[0],
          "user_answer": choosenAnswer[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    var summaryData = getSummary();
    var numTotalQuestion = questions.length;
    var numCorrectQuestion = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Out of $numTotalQuestion question $numCorrectQuestion question are correct ! ",
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            QuestionSummary(summaryData),
            const SizedBox(height: 20),
            TextButton(
              onPressed: restartScreen,
              child: const Text(
                "Restart Quiz",
                style: TextStyle(color: Color.fromARGB(255, 251, 251, 252),fontSize: 25),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}

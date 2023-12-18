import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {Key? key}) : super(key: key);
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      
      child: SingleChildScrollView(
        
        child: Column(
          children: List.generate(summaryData.length, (index) {
            var data = summaryData[index];
            var correctColor = data["user_answer"] == data["correct_answer"]
                ? Colors.green
                : const Color.fromARGB(255, 248, 2, 2);
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30,bottom: 70),
                  child: Text(
                    ((data["questionIndex"] as int) + 1).toString(),
                    style: TextStyle(color: correctColor, fontSize: 50),
                   
                  ),
                ),
                Expanded(
                  child: Column(
                   // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          data["question"] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),fontSize: 25),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data["correct_answer"] as String,
                        style: const TextStyle(color:  Color.fromARGB(255, 250, 226, 3),fontSize: 18),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data["user_answer"] as String,
                        style:  TextStyle(
                            color:correctColor),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

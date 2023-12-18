import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class StartScreen extends StatelessWidget {
  const StartScreen( this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz1.png",
            width: 300,
           // color:Color.fromARGB(225, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset("assets/images/quiz1.png", width: 300),
          // ),
           Text(
            "Learn flutter in fun way!",
            style: GoogleFonts.ubuntuCondensed(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.normal
        ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
              backgroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start quiz"),
          )
        ],
      ),
    );
  }
}

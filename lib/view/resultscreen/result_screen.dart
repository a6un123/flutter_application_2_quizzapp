import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/catogaryscreen/cata_Garyscreen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.rightanswercount,
    required this.wronganswercount,
    required this.skipanswer, required this.questions,
  });
  final int rightanswercount;
  final int wronganswercount;
  final int skipanswer;
  final int questions;

  @override
  Widget build(BuildContext context) {
    double percentage = rightanswercount * 100 / questions;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Congrats",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "$percentage%",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "correctanswer : $rightanswercount",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "woronganswer : $wronganswercount",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "skipedquestions : $skipanswer",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CataGaryscreen(),
                      ));
                },
                child: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "restart",
                        style: TextStyle(color: Colors.black),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}

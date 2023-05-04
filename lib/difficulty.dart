import 'package:flutter/material.dart';
import 'package:quiz_app/displayQuestion.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({super.key, required this.operation});
  final String operation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.blue.shade700,
        title: const Text("Choose Difficulty"),
      ),
      body: Column(
        children: [
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DisplayQuestion(operation:operation,difficulty:"easy");
                }));
              },
              child: tileCont("Easy")),
          const Divider(
            height: 2,
            thickness: 2,
          ),
          InkWell(
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DisplayQuestion(operation:operation,difficulty:"normal");
                }));
              },
              child: tileCont("Normal")),
          const Divider(
            height: 2,
            thickness: 2,
          ),
          InkWell(
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DisplayQuestion(operation:operation,difficulty:"hard");
                }));
              },child: tileCont("Hard")),
          const Divider(
            height: 2,
            thickness: 2,
          ),
        ],
      ),
    );
  }

  Widget tileCont(String difficulty) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10.0, 8.0, 2.0),
      child: ListTile(
        title: Text(
          difficulty,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25,
              color: Colors.blue.shade800),
        ),
      ),
    );
  }
}

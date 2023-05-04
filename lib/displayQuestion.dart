import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/operation.dart';
import 'difficulty.dart';
import 'question.dart';

class DisplayQuestion extends StatefulWidget {
  const DisplayQuestion(
      {super.key, required this.difficulty, required this.operation});
  final String difficulty;
  final String operation;
  @override
  State<DisplayQuestion> createState() =>
      // ignore: no_logic_in_create_state
      _DisplayQuestionState(difficulty, operation);
}

class _DisplayQuestionState extends State<DisplayQuestion> {
  int _minutes = 10;
  int _seconds = 10;
  Timer? _timer;
  List<Question>? questions = [];
  List<String> answers = [];
  final List<String?> _selectedValues = [];
  void startTimer() {
    const onesec = Duration(seconds: 1);
    _timer = Timer.periodic(onesec, (timer) {
      setState(() {
        if (_seconds < 1 && _minutes < 1) {
          _submit();
        } else if (_seconds < 1) {
          _seconds = 59;
          _minutes--;
        } else {
          _seconds--;
        }
      });
    });
  }

  void _submit() {
    _timer?.cancel();
    int mark = 0;
    for (var i = 0; i < questions!.length; i++) {
      String answer = questions![i].answer;
      String? chosenAnswer = _selectedValues[i];
      if (chosenAnswer != null) {
        if (chosenAnswer == answer) {
          mark++;
        }
      }
    }
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Column(
              children: [
                const Spacer(),
                Text(
                  mark.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DisplayQuestion(
                            operation: operation, difficulty: difficulty);
                      }));
                    },
                    child: const Text("Restart")),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Difficulty(operation: operation);
                        },
                      ));
                    },
                    child: const Text("Change Difficulty")),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Operation(),
                          ));
                    },
                    child: const Text("Restart From Operation")),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _DisplayQuestionState(this.difficulty, this.operation);
  final String difficulty;
  final String operation;

  @override
  void initState() {
    super.initState();
    questions = getQuestion(difficulty, operation)[0];
    answers = getQuestion(difficulty, operation)[1];
    for (var i = 0; i < questions!.length; i++) {
      _selectedValues.add(null);
    }
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Questions "),
            actions: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                      "${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}"),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, OIndex) {
                        Question question = questions![OIndex];
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              shape: BoxShape.rectangle),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 50, horizontal: 20),
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.blue)),
                                  child: Text(
                                    question.question,
                                    style: const TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: question.options.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String value = question.options[index];
                                    return RadioListTile(
                                        title: Text(
                                          value,
                                          style: const TextStyle(fontSize: 19),
                                        ),
                                        value: value,
                                        groupValue: _selectedValues[OIndex],
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedValues[OIndex] = newValue;
                                          });
                                        });
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 30,
                        );
                      },
                      itemCount: questions!.length),
                ),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: const Text(
                              "Are you sure you want to submit?",
                            ),
                            actions: [
                              OutlinedButton(
                                  onPressed: _submit, child: const Text("Yes")),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("NO")),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text("Submit"))
              ],
            ),
          )),
    );
  }
}

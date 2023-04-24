import 'package:flutter/material.dart';
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
  List<Question>? questions = [];
  List<String> answers = [];
  final List<String?> _selectedValues = [];

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
      print(_selectedValues);
      print(answers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Questions ")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
                                padding: EdgeInsets.symmetric(
                                    vertical: 50, horizontal: 20),
                                alignment: Alignment.centerLeft,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.blue)),
                                child: Text(
                                  question.question,
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: question.options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  String value = question.options[index];
                                  return RadioListTile(
                                      title: Text(
                                        value,
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      value: value,
                                      groupValue: _selectedValues[OIndex],
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedValues[OIndex] = newValue;
                                          print(_selectedValues);
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
                      return SizedBox(
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
                          content: Text(
                            "Are you sure you want to submit?",
                          ),
                          actions: [
                            OutlinedButton(
                                onPressed: () {
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
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(mark.toString()),
                                      );
                                    },
                                  );
                                },
                                child: Text("Yes")),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("NO")),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade400,
                  ),
                  child: Text("Submit"))
            ],
          ),
        ));
  }
}

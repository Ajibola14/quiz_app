import 'dart:math';

import 'package:quiz_app/difficulty.dart';

class Question {
  String question;
  String answer;
  List<String> options;
  Question(this.question, this.options, this.answer);
}

List getQuestion(String difficulty, String operation) {
  List<Question> questions = [];
  List<String> answers = [];
  if (difficulty == "hard") {
    for (var i = 0; i < 10; i++) {
      int firstOperand = Random().nextInt(100) + 23;
      int secondOperand = Random().nextInt(100) + 23;
      String question = "$firstOperand $operation $secondOperand";
      String answer;
      if (operation == "+") {
        answer = (firstOperand + secondOperand).toString();
      } else if (operation == "-") {
        answer = (firstOperand - secondOperand).toString();
      } else if (operation == "*") {
        answer = (firstOperand * secondOperand).toString();
      } else {
        answer = (firstOperand / secondOperand).toString();
      }
      answers.add(answer);

      List<String> options = [
        answer,
        getRandom(int.parse(answer), 20, answer),
        getRandom(int.parse(answer), 10, answer),
        getRandom(int.parse(answer), 15, answer)
      ];
      options.shuffle();
      Question questionClass = Question(question, options, answer);
      questions.add(questionClass);
    }
    return questions;
  } else if (difficulty == "normal") {
    for (var i = 0; i < 10; i++) {
      int firstOperand = Random().nextInt(50) + 12;
      int secondOperand = Random().nextInt(50) + 12;
      String answer;
      if (operation == "+") {
        answer = (firstOperand + secondOperand).toString();
      } else if (operation == "-") {
        answer = (firstOperand - secondOperand).toString();
      } else if (operation == "*") {
        answer = (firstOperand * secondOperand).toString();
      } else {
        answer = (firstOperand / secondOperand).toString();
      }
      String question = "$firstOperand $operation $secondOperand";

      answers.add(answer);
      List<String> options = [
        answer,
        getRandom(int.parse(answer), 10, answer),
        getRandom(int.parse(answer), 5, answer),
        getRandom(int.parse(answer), 2, answer)
      ];
      options.shuffle();
      Question questionClass = Question(question, options, answer);
      questions.add(questionClass);
    }
    return questions;
  } else {
    for (var i = 0; i < 10; i++) {
      int firstOperand = Random().nextInt(75) + 15;
      int secondOperand = Random().nextInt(50) + 15;
      String answer;
      String question = "$firstOperand $operation $secondOperand";
      if (operation == "+") {
        answer = (firstOperand + secondOperand).toString();
      } else if (operation == "-") {
        answer = (firstOperand - secondOperand).toString();
      } else if (operation == "*") {
        answer = (firstOperand * secondOperand).toString();
      } else {
        answer = (firstOperand / secondOperand).toString();
      }
      answers.add(answer);

      List<String> options = [
        answer,
        getRandom(int.parse(answer), 15, answer),
        getRandom(int.parse(answer), 7, answer),
        getRandom(int.parse(answer), 4, answer)
      ];
      options.shuffle();
      Question questionClass = Question(question, options, answer);
      questions.add(questionClass);
    }
    return [questions,answers];
  }
}

String getRandom(int baseNumber, int range, String answer) {
  String randomNumber =
      (Random().nextInt(range * 2 + 1) + baseNumber - 1).toString();
  if (randomNumber == answer) {
    return getRandom(baseNumber, range, answer);
  }
  return randomNumber;
}

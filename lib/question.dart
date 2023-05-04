import 'dart:math';

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
      num firstOperand = Random().nextInt(100) + 23;
      num secondOperand = Random().nextInt(100) + 23;
      String question = "$firstOperand $operation $secondOperand";
      String answer;
      if (operation == "+") {
        answer = (firstOperand + secondOperand).toString();
      } else if (operation == "-") {
        answer = (firstOperand - secondOperand).toString();
      } else if (operation == "*") {
        answer = (firstOperand * secondOperand).toString();
      } else {
        answer = (firstOperand / secondOperand).toStringAsFixed(2);
      }
      answers.add(answer);

      List<String> options = [
        answer,
        getRandom(answer, 20, answer, operation),
        getRandom(answer, 10, answer, operation),
        getRandom(answer, 15, answer, operation)
      ];
      options.shuffle();
      Question questionClass = Question(question, options, answer);
      questions.add(questionClass);
    }
    return [questions, answers];
  } else if (difficulty == "normal") {
    for (var i = 0; i < 10; i++) {
      num firstOperand = Random().nextInt(50) + 12;
      num secondOperand = Random().nextInt(50) + 12;
      String answer;
      if (operation == "+") {
        answer = (firstOperand + secondOperand).toString();
      } else if (operation == "-") {
        answer = (firstOperand - secondOperand).toString();
      } else if (operation == "*") {
        answer = (firstOperand * secondOperand).toString();
      } else {
        answer = (firstOperand / secondOperand).toStringAsFixed(2);
      }
      String question = "$firstOperand $operation $secondOperand";

      answers.add(answer);
      List<String> options = [
        answer,
        getRandom(answer, 10, answer, operation),
        getRandom(answer, 5, answer, operation),
        getRandom(answer, 2, answer, operation)
      ];
      options.shuffle();
      Question questionClass = Question(question, options, answer);
      questions.add(questionClass);
    }
    return [questions, answers];
  } else {
    for (var i = 0; i < 10; i++) {
      int firstOperand = Random().nextInt(25) + 5;
      int secondOperand = Random().nextInt(25) + 5;
      String answer;
      String question = "$firstOperand $operation $secondOperand";
      if (operation == "+") {
        answer = (firstOperand + secondOperand).toString();
      } else if (operation == "-") {
        answer = (firstOperand - secondOperand).toString();
      } else if (operation == "*") {
        answer = (firstOperand * secondOperand).toString();
      } else {
        if (secondOperand > firstOperand) {
          int temp = firstOperand;
          firstOperand = secondOperand;
          secondOperand = temp;
          question = "$firstOperand $operation $secondOperand";
        }
        answer = (firstOperand / secondOperand).toStringAsFixed(2);
      }
      answers.add(answer);

      List<String> options = [
        answer,
        getRandom(answer, 15, answer, operation),
        getRandom(answer, 7, answer, operation),
        getRandom(answer, 4, answer, operation)
      ];
      options.shuffle();
      Question questionClass = Question(question, options, answer);
      questions.add(questionClass);
    }
    return [questions, answers];
  }
}

String getRandom(
    String baseNumber, int range, String answer, String operation) {
  if (operation == "/") {
    String randomNumber =
        (Random().nextDouble() + num.parse(answer)).toStringAsFixed(2);
    if (randomNumber == answer) {
      return getRandom(baseNumber, range, answer, operation);
    }
    return randomNumber;
  } else {
    String randomNumber =
        (Random().nextInt(range * 2 + 1) + int.parse(baseNumber) - 1)
            .toString();
    if (randomNumber == answer) {
      return getRandom(baseNumber, range, answer, operation);
    }
    return randomNumber;
  }
}

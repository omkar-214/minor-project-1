import '../models/question.dart';

List<Question> questionList = [
  Question(
    questionText: "Which company developed Flutter?",
    options: ["Facebook", "Google", "Microsoft", "Apple"],
    correctOptionIndex: 1,
  ),
  Question(
    questionText: "Which programming language is used in Flutter?",
    options: ["Java", "Kotlin", "Dart", "Swift"],
    correctOptionIndex: 2,
  ),
  Question(
    questionText: "Which method is used to update the UI or state in Flutter?",
    options: ["setState()", "changeState()", "updateUI()", "refresh()"],
    correctOptionIndex: 0,
  ),
  Question(
    questionText: "In Flutter, almost everything is a ______?",
    options: ["Class", "Widget", "Function", "Package"],
    correctOptionIndex: 1,
  ),
  Question(
    questionText: "What is the purpose of Navigator.push()?",
    options: [
      "To close the current screen",
      "To delete data",
      "To navigate to a new screen",
      "To restart the app"
    ],
    correctOptionIndex: 2,
  ),
  Question(
    questionText: "Which widget is used to align widgets vertically?",
    options: ["Row", "Stack", "Column", "Wrap"],
    correctOptionIndex: 2,
  ),
  Question(
    questionText: "Which data type is used for integer values in Dart?",
    options: ["String", "int", "bool", "double"],
    correctOptionIndex: 1,
  ),
  Question(
    questionText: "What is specified in the pubspec.yaml file?",
    options: [
      "UI design code",
      "Dependencies and assets",
      "Screen logic code",
      "Error logs"
    ],
    correctOptionIndex: 1,
  ),
  Question(
    questionText: "Which widget is immutable and does not change its state?",
    options: [
      "StatefulWidget",
      "StatelessWidget",
      "AnimatedWidget",
      "InheritedWidget"
    ],
    correctOptionIndex: 1,
  ),
  Question(
    questionText: "Which command is used to run a Flutter app?",
    options: ["flutter start", "flutter go", "flutter run", "flutter open"],
    correctOptionIndex: 2,
  ),
];
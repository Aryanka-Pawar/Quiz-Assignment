import 'package:quiz_assignment/Shared/constants.dart';

class AnswerModel{
  Option selectedOption;
  final List<String> options;
  final String correctAnswer;
  AnswerModel({
    required this.selectedOption,
    required this.options,
    required this.correctAnswer,
  });
}

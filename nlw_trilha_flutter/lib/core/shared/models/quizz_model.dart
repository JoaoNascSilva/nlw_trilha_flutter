import 'dart:convert';

import 'package:DevQuiz/core/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get levelParse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito",
      }[this]!;
}

class QuizzModel {
  final String title;
  final List<QuestionModel> questions;
  final String imagem;
  final Level level;
  final int questionAnswered;

  QuizzModel({
    required this.title,
    required this.questions,
    required this.imagem,
    required this.level,
    this.questionAnswered = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'imagem': imagem,
      'level': level.parse,
      'questionAnswered': questionAnswered,
    };
  }

  factory QuizzModel.fromMap(Map<String, dynamic> map) {
    return QuizzModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      imagem: map['imagem'],
      level: map['level'].toString().levelParse,
      questionAnswered: map['questionAnswered'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizzModel.fromJson(String source) =>
      QuizzModel.fromMap(json.decode(source));
}

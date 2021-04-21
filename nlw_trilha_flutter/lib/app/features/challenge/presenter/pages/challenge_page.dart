import 'package:DevQuiz/app/features/challenge/presenter/widgets/question_indicator/question_indicator.dart';
import 'package:DevQuiz/app/features/challenge/presenter/widgets/quizz/quizz_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          top: true,
          child: QuestionIndicatorWidget(),
        ),
      ),
      body: QuizzWidget(title: 'title'),
    );
  }
}

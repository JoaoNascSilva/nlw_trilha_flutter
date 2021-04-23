import 'package:DevQuiz/app/features/challenge/presenter/challenge_controller.dart';
import 'package:DevQuiz/app/features/challenge/presenter/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/app/features/challenge/presenter/widgets/question_indicator/question_indicator.dart';
import 'package:DevQuiz/app/features/challenge/presenter/widgets/quizz/quizz_widget.dart';
import 'package:DevQuiz/core/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({Key? key, required this.questions}) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();
  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    pageController.nextPage(
      duration: Duration(seconds: 1),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (quizz) => QuizzWidget(
                title: quizz.title,
                question: widget.questions[0],
                onChange: () {
                  nextPage();
                },
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: ValueListenableBuilder<int>(
          valueListenable: controller.currentPageNotifier,
          builder: (BuildContext context, value, Widget? child) =>
              value == widget.questions.length
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: NestButtonWidget.green(
                          label: 'Confirmar',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )),
                      ],
                    )
                  : Expanded(
                      child: NestButtonWidget.white(
                      label: 'Pular',
                      onTap: () {
                        nextPage();
                      },
                    )),
        ),
      ),
    );
  }
}

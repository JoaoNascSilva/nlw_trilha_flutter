import 'package:DevQuiz/app/features/home/presenter/widgets/appbar/appbar_widget.dart';
import 'package:DevQuiz/app/features/home/presenter/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/app/features/home/presenter/widgets/quizz_card/quizz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.only(top: 75.0, left: 7, right: 7),
        child: Column(
          children: [
            RowLevelButtonWidget(),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 8,
                children: [
                  QuizzCardWidget(),
                  QuizzCardWidget(),
                  QuizzCardWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

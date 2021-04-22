import 'package:DevQuiz/app/features/home/presenter/home_controller.dart';
import 'package:DevQuiz/app/features/home/presenter/home_state.dart';
import 'package:DevQuiz/app/features/home/presenter/widgets/appbar/appbar_widget.dart';
import 'package:DevQuiz/app/features/home/presenter/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/app/features/home/presenter/widgets/quizz_card/quizz_card_widget.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = HomeController();

  @override
  void initState() {
    super.initState();
    _homeController.getUser();
    _homeController.getQuizzes();
    _homeController.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_homeController.state == HomeState.error) {
      return Scaffold(
        body: Center(
          child: Text('Algo de errado não está certo, tente novamente :('),
        ),
      );
    }

    if (_homeController.state == HomeState.loading) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Só mais um minutinho que ja vai carregar!'),
              SizedBox(height: 20),
              CircularProgressIndicator(
                backgroundColor: AppColors.lightGreen,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.purple),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBarWidget(
        user: _homeController.user!,
      ),
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
                children: _homeController.quizzes!
                    .map(
                      (quizz) => QuizzCardWidget(
                        title: quizz.title,
                        completed:
                            "${quizz.questionAnswered}/${quizz.questions.length}",
                        valuePercent:
                            quizz.questionAnswered / quizz.questions.length,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

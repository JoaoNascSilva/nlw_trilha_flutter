import 'package:DevQuiz/app/features/home/presenter/widgets/score_card/score_card_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(205),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: AppGradients.linear,
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 151,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Olá,',
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: 'Gabriela',
                              style: AppTextStyles.titleBold,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://avatars.githubusercontent.com/u/61892998?s=400&u=f1568500cd9e67505a5f848a6862084439a5ff6a&v=4',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 4.0),
                  child: ScoreCardWidget(),
                )
              ],
            ),
          ),
        );
}

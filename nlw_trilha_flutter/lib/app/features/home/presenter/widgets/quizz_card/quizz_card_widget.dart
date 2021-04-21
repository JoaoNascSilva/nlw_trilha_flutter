import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/core/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizzCardWidget extends StatelessWidget {
  const QuizzCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(color: AppColors.border),
        ),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 10),
          Text('Gerenciamento de Estado'),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text('3 de 10', style: AppTextStyles.body11),
              ),
              Expanded(
                flex: 2,
                child: ProgresIndicatorWidget(
                  value: 0.3,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

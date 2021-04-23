import 'package:DevQuiz/app/features/challenge/presenter/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/core/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizzWidget extends StatefulWidget {
  final String title;
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizzWidget(
      {Key? key,
      required this.title,
      required this.question,
      required this.onSelected})
      : super(key: key);

  @override
  _QuizzWidgetState createState() => _QuizzWidgetState();
}

class _QuizzWidgetState extends State<QuizzWidget> {
  int? indexSelected;

  awnsers(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 64),
            Text(
              widget.question.title,
              style: AppTextStyles.heading,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            for (var i = 0; i < widget.question.awnsers.length; i++)
              AwnserWidget(
                awnser: awnsers(i),
                disabled: indexSelected != null,
                isSelected: indexSelected == i,
                onTap: (value) {
                  indexSelected = i;
                  Future.delayed(Duration(seconds: 1));
                  setState(() {});
                  widget.onSelected(value);
                },
              )
          ],
        ),
      ),
    );
  }
}

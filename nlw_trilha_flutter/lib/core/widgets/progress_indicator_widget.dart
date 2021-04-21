import 'package:flutter/material.dart';

import '../app_colors.dart';

class ProgresIndicatorWidget extends StatelessWidget {
  final double value;

  const ProgresIndicatorWidget({Key? key, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}

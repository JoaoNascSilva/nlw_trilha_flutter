import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:DevQuiz/core/app_colors.dart';

class NestButtonWidget extends StatelessWidget {
  final String label;
  final Color color;
  final Color fontColor;
  final Color borderColor;
  final Color overlayColor;
  final VoidCallback onTap;

  const NestButtonWidget({
    Key? key,
    required this.label,
    required this.color,
    required this.fontColor,
    required this.borderColor,
    required this.overlayColor,
    required this.onTap,
  }) : super(key: key);

  NestButtonWidget.green({required String label, required VoidCallback onTap})
      : this.color = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.label = label,
        this.overlayColor = AppColors.white.withOpacity(0.3),
        this.borderColor = AppColors.darkGreen,
        this.onTap = onTap;

  NestButtonWidget.white({required String label, required VoidCallback onTap})
      : this.color = AppColors.white,
        this.fontColor = AppColors.grey,
        this.label = label,
        this.overlayColor = AppColors.grey.withOpacity(0.1),
        this.borderColor = AppColors.border,
        this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          side: MaterialStateProperty.all(BorderSide(color: borderColor)),
          overlayColor: MaterialStateProperty.all(overlayColor),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}

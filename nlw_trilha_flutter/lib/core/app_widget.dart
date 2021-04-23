import 'package:DevQuiz/app/features/challenge/presenter/challenge_page.dart';
import 'package:DevQuiz/app/features/home/presenter/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:DevQuiz/app/features/home/presenter/home_state.dart';
import 'package:DevQuiz/app/features/home/repository/home_repository.dart';
import 'package:DevQuiz/core/shared/models/quizz_model.dart';
import 'package:DevQuiz/core/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier = ValueNotifier(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;

  HomeState get state => stateNotifier.value;

  UserModel? _user;
  UserModel? get user => _user;

  List<QuizzModel>? _quizzes;
  List<QuizzModel>? get quizzes => _quizzes;

  final _homeRepository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    _homeRepository.getUser().then((user) {
      _user = user;
      state = HomeState.success;
    }).catchError((e) {
      state = HomeState.error;
    });
  }

  void getQuizzes() async {
    state = HomeState.loading;
    _homeRepository.getQuizzes().then((quizzes) {
      _quizzes = quizzes;
      state = HomeState.success;
    }).catchError((e) {
      state = HomeState.error;
    });
  }
}

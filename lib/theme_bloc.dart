import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTheme {
  final Color scaffoldColor;

  AppTheme({required this.scaffoldColor});
}

abstract class ThemeEvent {}

class ChangeScaffoldColor extends ThemeEvent {}

class ThemeBloc extends Bloc<ThemeEvent, AppTheme> {
  ThemeBloc() : super(AppTheme(scaffoldColor: Colors.white)) {
    on<ChangeScaffoldColor>(
      (event, emit) =>
          emit(AppTheme(scaffoldColor: colors[Random().nextInt(4)])),
    );
  }
}

final colors = [
  Colors.red,
  Colors.white,
  Colors.blue,
  Colors.purple,
  Colors.pink
];

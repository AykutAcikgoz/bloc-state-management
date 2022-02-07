import 'package:flutter_bloc/flutter_bloc.dart';

class AppState {
  String language;

  AppState({required this.language});
}

abstract class LanguageEvent {}

class ChangeLanguagePressed extends LanguageEvent {}

class AppStateBloc extends Bloc<LanguageEvent, AppState> {
  AppStateBloc() : super(AppState(language: 'EN')) {
    on<ChangeLanguagePressed>(
      (event, emit) =>
          emit(AppState(language: state.language == "EN" ? "AR" : "EN")),
    );
  }
}

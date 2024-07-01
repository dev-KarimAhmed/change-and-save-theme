import 'package:bloc/bloc.dart';
import 'package:change_theme/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());

  ThemeData? mainTheme;
  int? _index;

  Future<void> getTheme({ThemeData? theme}) async {
    emit(ChangeThemeLoading());
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('index') != null) {
      _index = prefs.getInt('index');
    } else {
      _index = 0;
    }

    if (_index == 0) {
      mainTheme = AppTheme.lightBlueTheme;
      emit(ChangeThemeDone());
    } else if (_index == 1) {
      mainTheme = AppTheme.darkBlueTheme;
      emit(ChangeThemeDone());
    } else {
      mainTheme = AppTheme.darkRedTheme;
      emit(ChangeThemeDone());
    }
  }

  Future<void> saveIndex({int? index}) async {
    final prefs = await SharedPreferences.getInstance();
    if (index == null) {
      prefs.setInt('index', 0);
    } else {
      prefs.setInt('index', index);
    }
  }
}

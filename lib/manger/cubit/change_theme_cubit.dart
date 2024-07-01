import 'package:bloc/bloc.dart';
import 'package:change_theme/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());

  ThemeData? mainTheme;
  int? _index;

  Future<void> getTheme() async {
    emit(ChangeThemeLoading());
    
    final prefs = await SharedPreferences.getInstance();
    _index = prefs.getInt('index') ?? 0;

    switch (_index) {
      case 1:
        mainTheme = AppTheme.darkBlueTheme;
        break;
      case 2:
        mainTheme = AppTheme.darkRedTheme;
        break;
      default:
        mainTheme = AppTheme.lightBlueTheme;
    }

    emit(ChangeThemeDone());
  }

  Future<void> saveIndex({int? index}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('index', index ?? 0);
  }
}

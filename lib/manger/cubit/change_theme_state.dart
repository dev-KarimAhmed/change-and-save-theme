part of 'change_theme_cubit.dart';

@immutable
sealed class ChangeThemeState {}

final class ChangeThemeInitial extends ChangeThemeState {}
final class ChangeThemeLoading extends ChangeThemeState {}
final class ChangeThemeDone extends ChangeThemeState {}


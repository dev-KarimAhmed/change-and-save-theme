import 'package:change_theme/manger/cubit/change_theme_cubit.dart';
import 'package:change_theme/themes/app_theme.dart';
import 'package:change_theme/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeThemeCubit()..getTheme(),
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          final themeCubit = context.read<ChangeThemeCubit>();
          ThemeData currentTheme = themeCubit.mainTheme ?? AppTheme.lightBlueTheme;

          return MaterialApp(
            title: 'Change Theme',
            debugShowCheckedModeBanner: false,
            theme: currentTheme,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

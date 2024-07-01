import 'package:change_theme/manger/cubit/change_theme_cubit.dart';
import 'package:change_theme/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsChoose extends StatelessWidget {
  const ColorsChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose color'),
      ),
      body: BlocConsumer<ChangeThemeCubit, ChangeThemeState>(
        listener: (context, state) {
          if (state is ChangeThemeDone) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              ColorCard(
                color: const Color.fromARGB(255, 144, 1, 1),
                colorName: 'Red Dark',
                textColor: Colors.white,
                onTap: () {
                  context
                      .read<ChangeThemeCubit>()
                      .saveIndex(index: 2)
                      .then((value) {
                    context
                        .read<ChangeThemeCubit>()
                        .getTheme(theme: AppTheme.darkRedTheme);
                  });
                },
              ),
              ColorCard(
                  color: const Color.fromARGB(255, 0, 87, 158),
                  colorName: 'Blue Dark',
                  textColor: Colors.white,
                  onTap: () {
                                 context
                      .read<ChangeThemeCubit>()
                      .saveIndex(index: 1)
                      .then((value) {
    context
                      .read<ChangeThemeCubit>()
                      .getTheme(theme: AppTheme.darkRedTheme);
                      });
                  },),
              ColorCard(
                color: const Color.fromARGB(255, 44, 160, 255),
                colorName: 'Blue light',
                textColor: Colors.black,
                onTap: () {
                                 context
                      .read<ChangeThemeCubit>()
                      .saveIndex(index: 0)
                      .then((value) {
    context
                      .read<ChangeThemeCubit>()
                      .getTheme(theme: AppTheme.darkRedTheme);
                      });
                  },
              ),
            ],
          );
        },
      ),
    );
  }
}

class ColorCard extends StatelessWidget {
  const ColorCard({
    super.key,
    required this.color,
    required this.colorName,
    required this.textColor,
    this.onTap,
  });

  final Color color;
  final String colorName;
  final Color textColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            color: color,
            child: Text(
              colorName,
              style: TextStyle(color: textColor, fontSize: 20),
            )),
      ),
    );
  }
}

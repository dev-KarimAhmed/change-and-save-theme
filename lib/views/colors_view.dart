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
                  _changeTheme(context, 2);
                },
              ),
              ColorCard(
                color: const Color.fromARGB(255, 0, 87, 158),
                colorName: 'Blue Dark',
                textColor: Colors.white,
                onTap: () {
                  _changeTheme(context, 1);
                },
              ),
              ColorCard(
                color: const Color.fromARGB(255, 44, 160, 255),
                colorName: 'Blue Light',
                textColor: Colors.black,
                onTap: () {
                  _changeTheme(context, 0);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void _changeTheme(BuildContext context, int index) {
    context.read<ChangeThemeCubit>().saveIndex(index: index).then((_) {
      // context.read<ChangeThemeCubit>().getTheme();
    });
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
          padding: const EdgeInsets.all(16),
          color: color,
          child: Text(
            colorName,
            style: TextStyle(color: textColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_shift_pro/cors/widgets/bloc/cubit/theme_cubit.dart';
import 'package:stock_shift_pro/utils/constants/sizes.dart';
import 'package:stock_shift_pro/utils/extensions/spacer_extension.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  final List<(String, ThemeMode)> _themes = const [
    ('Dark', ThemeMode.dark),
    ('Light', ThemeMode.light),
    ('System', ThemeMode.system),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showThemeModal(context),
      child: Icon(
        Icons.color_lens_outlined,
        size: 20,
        color: Theme.of(context).colorScheme.primary,
      ),
      // child: Image.asset(AppImages.themeIconUrl),
    );
  }

  void _showThemeModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, selectedTheme) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Select Theme', style: context.headlineLarge),
                10.height,
                ..._themes.map((themeData) {
                  final String label = themeData.$1;
                  final ThemeMode theme = themeData.$2;

                  return ListTile(
                    title: Text(
                      label,
                      style:
                          selectedTheme == theme
                              ? context.headlineLarge
                              : context.bodyLarge,
                    ),
                    onTap: () {
                      context.read<ThemeCubit>().updateTheme(theme);
                      Navigator.pop(context); // Close modal after selection
                    },
                    trailing:
                        selectedTheme == theme
                            ? Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.primary,
                            )
                            : null,
                  );
                }),
              ],
            ).paddingAll(AppSizes.defaultSpace);
          },
        );
      },
    );
  }
}

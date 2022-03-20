import 'package:flutter/material.dart';
import 'package:next_app/presentation/theme/color/theme_colors.dart';

Map<ThemeMode, ThemeData> get appThemes {
  final theme = ThemeData();
  return {
    ThemeMode.light: theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        secondary: LightThemeColors.primaryAccent,
      ),
      primaryColor: LightThemeColors.primaryAccent,
      scaffoldBackgroundColor: LightThemeColors.background,
      canvasColor: Colors.transparent,
      brightness: Brightness.light,
    ),
    ThemeMode.dark: theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        secondary: DarkThemeColors.primaryAccent,
      ),
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: DarkThemeColors.background,
      brightness: Brightness.dark,
    ),
  };
}

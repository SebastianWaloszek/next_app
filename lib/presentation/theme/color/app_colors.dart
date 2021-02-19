import 'dart:ui';

import 'package:flutter/material.dart';

import 'theme_colors.dart';
import 'themed_color.dart';

abstract class AppColors {
  static Color primaryContent(BuildContext context) => ThemedColor(
        light: LightThemeColors.primaryContent,
        dark: DarkThemeColors.primaryContent,
      ).getColor(context);

  static Color secondaryContent(BuildContext context) => ThemedColor(
        light: LightThemeColors.secondaryContent,
        dark: DarkThemeColors.secondaryContent,
      ).getColor(context);

  static Color primaryAccent(BuildContext context) => ThemedColor(
        light: LightThemeColors.primaryAccent,
        dark: DarkThemeColors.primaryAccent,
      ).getColor(context);

  static Color secondaryAccent(BuildContext context) => ThemedColor(
        light: LightThemeColors.secondaryAccent,
        dark: DarkThemeColors.secondaryAccent,
      ).getColor(context);

  static Color background(BuildContext context) => ThemedColor(
        light: LightThemeColors.background,
        dark: DarkThemeColors.background,
      ).getColor(context);

  static Color buttonContent(BuildContext context) => ThemedColor(
        light: LightThemeColors.buttonContent,
        dark: DarkThemeColors.buttonContent,
      ).getColor(context);
}

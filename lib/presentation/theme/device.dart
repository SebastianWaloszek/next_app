import 'package:flutter/material.dart';

abstract class Device {
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static bool isLightTheme(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light;
  static bool isDarkTheme(BuildContext context) => !isLightTheme(context);
}

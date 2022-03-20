import 'package:flutter/material.dart';
import 'package:next_app/presentation/localization/localization.dart';
import 'package:next_app/presentation/navigation_routes.dart';
import 'package:next_app/presentation/theme/app_themes.dart';

class MyApp extends StatelessWidget {
  static const String appName = 'NextApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp.appName,
      theme: appThemes[ThemeMode.light],
      darkTheme: appThemes[ThemeMode.dark],
      routes: navigationRoutes,
      localizationsDelegates: localizationDelegates,
      supportedLocales: supportedLocales,
    );
  }
}

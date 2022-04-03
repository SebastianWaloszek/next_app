import 'package:flutter/material.dart';
import 'package:next_app/src/feature/example/presentation/screen/example_screen.dart';

/// The application's top-level routing table.
final Map<String, WidgetBuilder> appNavigationRoutes = <String, WidgetBuilder>{
  '/': (BuildContext context) => const ExampleScreen(title: 'Home')
};

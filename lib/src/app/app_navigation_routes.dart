import 'package:flutter/material.dart';
import 'package:next_app/src/features/example/presentation/screens/example_screen.dart';

/// The application's top-level routing table.
final Map<String, WidgetBuilder> appNavigationRoutes = <String, WidgetBuilder>{
  '/': (BuildContext context) => const ExampleScreen(title: 'Home')
};

import 'package:flutter/widgets.dart';
import 'package:next_app/src/app/app.dart';
import 'package:next_app/src/di/injector.dart';

/// Sets up application dependencies and runs the app.
Future<void> runApplication() async {
  setupDependencies();

  runApp(App());
}

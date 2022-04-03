import 'package:next_app/src/app/app_runner.dart';
import 'package:next_app/src/di/injector.dart';

Future<void> main() async {
  setupDependencies();

  return runApplication();
}

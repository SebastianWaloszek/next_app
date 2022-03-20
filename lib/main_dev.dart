import 'package:next_app/common/environment/environment.dart';
import 'package:next_app/common/environment/environment_dev.dart';
import 'package:next_app/src/app/app_runner.dart';

Future<void> main() async {
  Environment.setCurrent(DevelopmentEnvironment());

  return runApplication();
}

import 'package:flutter/widgets.dart';
import 'package:next_app/common/environment/environment.dart';
import 'package:next_app/common/environment/environment_dev.dart';
import 'package:next_app/common/utils/injector.dart';
import 'package:next_app/presentation/app.dart';

void main() {
  Environment.setCurrent(DevelopmentEnvironment());
  Injector.setup();
  runApp(MyApp());
}

import 'package:flutter/widgets.dart';
import 'package:next_app/common/environment/environment.dart';
import 'package:next_app/common/environment/environment_prod.dart';
import 'package:next_app/common/utils/injector.dart';
import 'package:next_app/presentation/app.dart';

void main() {
  Environment.setCurrent(ProductionEnvironment());
  Injector.setup();
  runApp(MyApp());
}

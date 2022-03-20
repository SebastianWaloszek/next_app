import 'package:flutter/widgets.dart';
import 'package:next_app/common/utils/injector.dart';
import 'package:next_app/presentation/app.dart';

Future<void> runApplication() async {
  Injector.setup();

  runApp(MyApp());
}

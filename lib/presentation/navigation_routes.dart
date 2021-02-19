import 'package:flutter/material.dart';
import 'package:next_app/presentation/features/example/example.dart';

final Map<String, WidgetBuilder> navigationRoutes = <String, WidgetBuilder>{
  '/': (BuildContext context) => const MyHomePage(title: 'Home')
};

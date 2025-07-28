import 'package:flutter/material.dart';
import 'package:readly/View/home_screen.dart';

class AppRoutes {
  static const String home = "/home";
  static const String detailScreen = "/detailsscreen";

  static Map<String, WidgetBuilder> routes = {home: (context) => HomeScreen()};
}

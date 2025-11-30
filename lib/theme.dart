// 🐦 Flutter imports:
import 'package:flutter/material.dart';

ThemeData themeData(BuildContext context) {
  var brightness = View.of(context).platformDispatcher.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  ThemeData themeData = ThemeData.light();
  if (isDarkMode) {
    themeData = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
    );
  }
  return themeData;
}

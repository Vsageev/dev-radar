import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomColors {
  static const Color text = Colors.black;
  static const Color background = Colors.white;
  static const Color backgroundAccent = Color.fromARGB(255, 220, 220, 220);
  static const Color accent = Colors.blue;
  static const Color buttonDisabled = backgroundAccent; //Color.fromARGB(255, 180, 180, 180);

  static const Color searchbar = Color.fromARGB(255, 237, 237, 237);
  static const Color hint = Color.fromARGB(255, 150, 150, 150);

  static const Color navbar = Color.fromARGB(255, 200, 200, 200);
  static const Brightness systemBrightness = Brightness.dark;
}

changeNavbarColor() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: CustomColors.systemBrightness,
    statusBarBrightness: CustomColors.systemBrightness,
    statusBarIconBrightness: CustomColors.systemBrightness,
    systemNavigationBarColor: CustomColors.navbar,
  ));
}

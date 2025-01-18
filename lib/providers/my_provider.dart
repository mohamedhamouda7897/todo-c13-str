import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  changeTheme(int index, String local) {
    if (index == 0 && local == 'en') {
      themeMode = ThemeMode.light;
    } else if (index == 0 && local == 'ar') {
      themeMode = ThemeMode.light;
    } else if (index == 1 && local == 'en') {
      themeMode = ThemeMode.dark;
    } else if (index == 1 && local == 'ar') {
      themeMode = ThemeMode.dark;
    }
    // if (themeMode == ThemeMode.light) {
    //   themeMode = ThemeMode.dark;
    // } else {
    //   themeMode = ThemeMode.light;
    // }

    notifyListeners();
  }
}

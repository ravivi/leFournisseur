import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/data/constant.dart';

import 'package:flutter/material.dart';

// This is our  main focus
// Let's apply light and dark theme on our app
// Now let's add dark theme on our app


final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);


class Themes {
  static final light = ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: kContentColorLightTheme),

    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );


  static final dark = ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: kContentColorDarkTheme),
    colorScheme: ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );


}


// class ThemeService  {
//   final _box = GetStorage();
//    final prefs = SharedPreferences.getInstance();
//   final _key = 'isDarkMode';
  
//   /// Get isDarkMode info from local storage and return ThemeMode
//   ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

//   /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
//   bool _loadThemeFromBox() => _box.read(_key) ?? false;
  
//   /// Save isDarkMode to local storage
//   _saveThemeToBox(bool isDarkMode)async => _box.write(_key, isDarkMode);

//   _saveTheme() async {
//   final prefs = await SharedPreferences.getInstance();
//   final key = 'theme';
//   final _theme = prefs.getString(key) ?? "light";
//   final value = _theme;
//   prefs.setString(key, value);
//  }
//  _readTheme(context) async {
//   final prefs = await SharedPreferences.getInstance();
//   final key = 'theme';
//   final _theme = prefs.getString(key) ?? "light"; //set theme to light if the key is not found in SharedPreferences
//   Get.changeTheme(
//    _theme == 'light' ? ThemeData.light() : ThemeData.dark());
// }
  
//   /// Switch theme and save to local storage
//   void switchTheme() {
//     Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
//     _saveThemeToBox(!_loadThemeFromBox());
//   }
// }
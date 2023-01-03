import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static const _language = 'language';
  static const lightTheme = "light";
  static const darkTheme = "dark";
  static const _theme = 'theme';
  static const _names = 'names';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setLanguage(String language) async =>
      await _preferences.setString(_language, language);

  static String getLanguage() => _preferences.getString(_language).toString();

  // ignore: no_leading_underscores_for_local_identifiers
  static Future saveThemePreference(ThemeMode _themeMode) async {
    String themeMode;
    if (_themeMode == ThemeMode.light) {
      themeMode = lightTheme;
    } else {
      themeMode = darkTheme;
    }
    _preferences.setString(_theme, themeMode);
  }

  static ThemeMode getThemePreference() {
    String theme = _preferences.getString(_theme).toString();
    if (theme == lightTheme) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

 static List names = [
    "جدي الغالي الأستاذ علي علي عبد العزيز",
    'جدتي الغالية الأستاذة إنصاف عبد المجيد',
    ' خالي الحبيب اللواء حسام علي علي',
    'جدي الحاج محمود عثمان',
    'جدتي الحاجه فاطمة الألموشي',
    'جدي الأستاذ الجبالي السيد عبدالله',
    'جدتي الحاجه نظيمه عبد الفتاح السيد',
    'جدي الحاج أحمد شحاته',

  ];

   static Future savenamesPreference(List<String> names) async {
   await _preferences.setStringList(_names, names);
  }

  static List<String>?  getNamesPrefrences (){
    return _preferences.getStringList(_names);
  }
}

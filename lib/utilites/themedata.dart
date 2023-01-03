import 'package:flutter/material.dart';

class ThemeDataProvider {
  static const primaryDarkThemeColor = Color.fromARGB(255, 39, 39, 39);
  static const textDarkThemeColor = Colors.white;
  static const backgroundDarkColor = Color.fromARGB(255, 55, 57, 58);

  static const backgroundLight = "assets/images/blight.png";
  static const backgroundDark = "assets/images/bdark.png";
  static const backgroundLightWeb = "assets/images/blight-web.png";
  static const backgroundDarkWeb = "assets/images/bdark-web.png";


    static const mainAppColor = Color(0XFF2D4CAF);


  static const textLightThemeColor = Color.fromARGB(255, 58, 58, 58);
  static const backgroundLightColor = Colors.white;
  static const primaryLightThemeColor = Colors.white;

  static final lightTheme = ThemeData(
    fontFamily: 'Cairo',
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white, modalBackgroundColor: Colors.white),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: textLightThemeColor),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: primaryLightThemeColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryLightThemeColor),
        minimumSize: MaterialStateProperty.all(const Size(150, 40)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: const BorderSide(
              color: primaryLightThemeColor,
            ),
          ),
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
        fontFamily: 'Cairo',

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: primaryDarkThemeColor,
      modalBackgroundColor: primaryDarkThemeColor,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: textDarkThemeColor,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: primaryDarkThemeColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryDarkThemeColor),
        minimumSize: MaterialStateProperty.all(const Size(150, 40)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: const BorderSide(
              color: primaryDarkThemeColor,
            ),
          ),
        ),
      ),
    ),
  );
}

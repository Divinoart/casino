import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
class Constants{
  final RemoteConfig remoteConfig = RemoteConfig.instance;
  static int colorCode = 0xfffcfcff;

  level() {
    colorCode = remoteConfig.getInt("lightPrimary");
    print(colorCode);
    print(0xfffcfcff);
  }

  static String appName = "kashflow";

  //Colors for theme
//  Color(0xfffcfcff);
//   static Color li = remoteConfig.getInt("key");
  static Color lightPrimary = Color(colorCode);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.red;
  static Color darkAccent = Colors.red;
  static Color lightBG = Color(colorCode);
  static Color darkBG = Colors.black;
  static Color ratingBG = Colors.yellow[600];

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Montserrat',
    backgroundColor: lightBG,
    brightness: Brightness.light,
    primaryColor: lightPrimary,
    accentColor:  lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
    ),
  );


}
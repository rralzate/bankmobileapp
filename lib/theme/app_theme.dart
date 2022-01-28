import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromRGBO(78, 77, 77, 1);
  static const Color secondary = Color.fromRGBO(243, 145, 73, 1);
  static const Color background = Color.fromRGBO(192, 192, 192, 1);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Color primario
    primaryColor: primary,

    // AppBar Theme
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
      headline2: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
      subtitle1: TextStyle(fontFamily: 'Lato', color: Colors.white),
      subtitle2:
          TextStyle(fontSize: 35, fontFamily: 'Lato', color: Colors.white),
      bodyText1: TextStyle(fontSize: 15.0, fontFamily: 'Lato', color: primary),
      bodyText2:
          TextStyle(fontSize: 15.0, fontFamily: 'Lato', color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: secondary, background: secondary),

    // TextButton Theme
    textButtonTheme:
        TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),

    // FloatingActionButtons
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary, elevation: 5),

    // ElevatedButtons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: primary, shape: const StadiumBorder(), elevation: 0),
    ),
    // inputDecorationTheme: const InputDecorationTheme(
    //   floatingLabelStyle: TextStyle(color: primary),
    //   enabledBorder: OutlineInputBorder(
    //       borderSide: BorderSide(color: primary),
    //       borderRadius: BorderRadius.only(
    //           bottomLeft: Radius.circular(10),
    //           topRight: Radius.circular(10))),
    //   focusedBorder: OutlineInputBorder(
    //       borderSide: BorderSide(color: primary),
    //       borderRadius: BorderRadius.only(
    //           bottomLeft: Radius.circular(10),
    //           topRight: Radius.circular(10))),
    // )
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(

      // Color primario
      primaryColor: primary,

      // AppBar Theme
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: Colors.black);
}

import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData craeteTheme() => ThemeData(
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline6: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          headline5: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          headline4: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          subtitle1: TextStyle(fontSize: 16.0),
          subtitle2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
          bodyText1: TextStyle(fontSize: 12.0),
          bodyText2: TextStyle(fontSize: 10.0),
        ),
        buttonTheme: const ButtonThemeData(
            colorScheme: ColorScheme.light(
                onTertiaryContainer: Colors.red, onPrimaryContainer: Colors.orange, onErrorContainer: Colors.blue)),
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
        // cardColor: theme.colors.colorScheme?.onSecondary,
        // secondaryHeaderColor: theme.colors.colors.notificationPink,
        // bottomAppBarColor: theme.colors.scaffoldBackgroundColor,
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(onPrimary: Colors.blue)),
        inputDecorationTheme: _inputDecoration(),
        bottomAppBarTheme: const BottomAppBarTheme(
          //color: theme.colors.colorScheme?.onSecondary,
          elevation: 10,
          shape: CircularNotchedRectangle(),
        ),
        // textSelectionTheme: TextSelectionThemeData(
        //   cursorColor: theme.colors.cursorColor,
        //   selectionColor: theme.colors.switchBackgroundColor?.withOpacity(0.1),
        // ),
        appBarTheme: _appBarTheme(),
        scaffoldBackgroundColor: const Color(0xfffafafa),
        colorScheme: const ColorScheme(
          primary: Colors.white,
          onBackground: Color(0xfffafafa),
          onSecondary: Color(0xff292f3b), //x
          error: Colors.red, //x
          // onTertiary: colors.watermelon, //x
          onPrimary: Colors.white,
          onSurface: Colors.grey,
          background: Color(0xfffafafa),
          // onError: colors.brandPink,
          secondary: Colors.deepPurpleAccent,
          surface: Colors.orange,
          onError: Colors.red,
          brightness: Brightness.light,
        ),
        cardTheme: const CardTheme(elevation: 10, shadowColor: Color(0xfffafafa)),
      );

  static InputDecorationTheme _inputDecoration() {
    return InputDecorationTheme(
        prefixIconColor: Colors.grey,
        labelStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
        fillColor: Colors.blue.shade900,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(style: BorderStyle.none, color: Colors.grey)),
        border: const OutlineInputBorder());
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      color: Colors.white,
      // backgroundColor: theme.colors.colorScheme?.onSecondary,
      elevation: 5,
      iconTheme: IconThemeData(color: Colors.blue.shade900),
      titleTextStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.blue.shade900),
    );
  }
}

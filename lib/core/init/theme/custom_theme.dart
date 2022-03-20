import 'package:flutter/material.dart';

import '../../../product/utils/padding/page_padding.dart';
import '../../../product/utils/radius/general_radius.dart';

class ThemeManager {
  static ThemeData craeteTheme() => ThemeData(
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline6: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            // padding: const PagePadding.horizontalSymmetric(),
            primary: const Color(0xff292f3b),
            onPrimary: Colors.white,
            alignment: Alignment.centerLeft,
            shape: const RoundedRectangleBorder(borderRadius: GeneralRadius.allNormal()),
          ),
        ),

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
          onSecondary: Color(0xff292f3b),
          error: Colors.red, //x
          onPrimary: Colors.white,
          onSurface: Colors.grey,
          background: Color(0xfffafafa),
          secondary: Colors.deepPurpleAccent,
          surface: Colors.orange,
          onError: Colors.red,
          brightness: Brightness.light,
        ),
        cardTheme: const CardTheme(elevation: 10, shadowColor: Color(0xfffafafa)),
      );

  static InputDecorationTheme _inputDecoration() {
    return InputDecorationTheme(
      prefixIconColor: Colors.grey.shade300,
      focusedBorder: const OutlineInputBorder(borderRadius: GeneralRadius.allNormal()),
      enabledBorder: const OutlineInputBorder(
          borderRadius: GeneralRadius.allNormal(), borderSide: BorderSide(color: Color(0xff292f3b))),
      hintStyle: TextStyle(color: Colors.grey.shade400),
      fillColor: const Color(0xff292f3b),
      contentPadding: const PagePadding.horizontalLowSymmetric(),
      disabledBorder: const OutlineInputBorder(borderRadius: GeneralRadius.allNormal()),
    );
  }

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
      color: Colors.white,
      // backgroundColor: theme.colors.colorScheme?.onSecondary,
      elevation: 5,
      iconTheme: IconThemeData(color: Color(0xff292f3b)),
      titleTextStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xff292f3b)),
    );
  }
}

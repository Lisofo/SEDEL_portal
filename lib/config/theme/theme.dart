import 'package:flutter/material.dart';

final colorList = <Color>[
  const Color.fromARGB(255, 52, 120, 62),
];

class AppTheme{

  final int selectedColor;

  AppTheme({this.selectedColor = 0});



  ThemeData getTheme() => ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: colorList[selectedColor],
      onPrimary: Colors.white, 
      secondary: Colors.green, 
      onSecondary: Colors.white,
      tertiary: Colors.green[100], 
      error: Colors.red, 
      onError: Colors.black, 
      surface: Colors.white, 
      onSurface: Colors.black,
      surfaceTint: Colors.grey,
      
    ),

    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );

}
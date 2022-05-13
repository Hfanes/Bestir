import 'package:flutter/material.dart';

class OurTheme{
   Color _lightGreen = Color.fromARGB(255, 20, 20, 20);
   Color _lightGrey = Color.fromARGB(255, 50, 50, 50);
   Color _darkGrey = Color.fromARGB(255, 100, 100, 100);
   Color  _red =  Color.fromARGB(255, 255, 0, 0);


  ThemeData buildTheme(){
    return ThemeData(
      canvasColor: _lightGreen,
      primaryColor: _lightGrey,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: _darkGrey),
      secondaryHeaderColor: _red,
      hintColor: _lightGrey,
      inputDecorationTheme: InputDecorationTheme(
          border:OutlineInputBorder(
              borderRadius:BorderRadius.circular(20.0),
          borderSide:BorderSide(
            color: _red,
          ),
          ),
        focusedBorder:OutlineInputBorder(
          borderRadius:BorderRadius.circular(20.0),
    borderSide:BorderSide(
    color: _darkGrey,
         ),
         ),
    ),
      buttonTheme:ButtonThemeData (
        buttonColor: _red,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        minWidth: 200,
        height: 40,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)
        ),
      ),
    );
  }

}
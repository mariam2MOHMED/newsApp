import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme= ThemeData(

  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: Colors.pink,

  appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(
          color: Colors.white
      ),
      backgroundColor:  HexColor('333739'),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      )
  ),
  textTheme: TextTheme(
      bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(

      selectedItemColor: Colors.deepOrange,

      backgroundColor:  HexColor('333739'),
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(
        color: Colors.deepOrange,

      )
  ),


);
ThemeData lightTheme=ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(
          color: Colors.black87
      ),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      )
  ),
  textTheme: TextTheme(

      bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(

      selectedItemColor: Colors.deepOrange,

      backgroundColor:  Colors.white,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black54,
      selectedLabelStyle: TextStyle(
        color: Colors.deepOrange,

      )
  ),


);
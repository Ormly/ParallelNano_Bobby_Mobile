import 'package:flutter/material.dart';

/// [darkTheme].
final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Color(0xFF121212),
  brightness: Brightness.dark,
  backgroundColor: Color(0xFF212121),
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  textSelectionHandleColor: Colors.grey[700],
  indicatorColor: Colors.grey,
  buttonColor: Color(0xFF212121),
  splashColor: Colors.white54,
  iconTheme: IconThemeData(color: Colors.grey),
  textTheme: TextTheme(
    title: TextStyle(
      fontFamily: 'Open_Sans',
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
    ),
    subtitle: TextStyle(
      fontFamily: 'Open_Sans',
    ),
    overline: TextStyle(
      fontFamily: 'Open_Sans',
    ),
    button: TextStyle(
      fontFamily: 'Open_Sans',
      fontWeight: FontWeight.bold,
      color: Color(0xFF448E7A),
    ),
    subhead: TextStyle(
      fontFamily: 'Open_Sans',
    ),
    caption: TextStyle(
      fontFamily: 'Open_Sans',
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
    ),
    headline: TextStyle(
      fontFamily: 'Open_Sans',
      fontWeight: FontWeight.bold,
    ),
    display1: TextStyle(
      fontFamily: 'Open_Sans',
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontSize: 18.0,
    ),
    display2: TextStyle(
      fontFamily: 'Open_Sans',
      fontWeight: FontWeight.bold,
      color: Color(0xFF448E7A),
      fontSize: 20.0,
    ),
  ),
);

/// [lightTheme].
final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Color(0xFF2C59A5),
  brightness: Brightness.light,
  backgroundColor: Color(0xFFE5E5E5),
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  textSelectionHandleColor: Colors.grey[200],
  indicatorColor: Colors.white70,
  splashColor: Colors.black12,
  iconTheme: IconThemeData(color: Color(0xFF2C59A5)),
  textTheme: TextTheme(
    title: TextStyle(
      fontFamily: 'Open_Sans',
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
    ),
    subtitle: TextStyle(
      fontFamily: 'Open_Sans',
    ),
    overline: TextStyle(
      fontFamily: 'Open_Sans',
    ),
    button: TextStyle(
      fontFamily: 'Open_Sans',
      fontWeight: FontWeight.bold,
      color: Color(0xFF448E7A),
    ),
    subhead: TextStyle(
      fontFamily: 'Open_Sans',
    ),
    caption: TextStyle(
      fontFamily: 'Open_Sans',
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
    ),
    headline: TextStyle(
      fontFamily: 'Open_Sans',
      fontWeight: FontWeight.bold,
    ),
    display1: TextStyle(
      fontFamily: 'Open_Sans',
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontSize: 18.0,
    ),
    display2: TextStyle(
      fontFamily: 'Open_Sans',
      fontWeight: FontWeight.bold,
      color: Color(0xFF448E7A),
      fontSize: 20.0,
    ),
  ),
);

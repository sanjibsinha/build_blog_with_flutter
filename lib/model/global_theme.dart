import 'package:flutter/material.dart';

class GlobalTheme with ChangeNotifier {
  final globalTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 22,
      ),
      bodyText2: TextStyle(
        color: Colors.blue,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      caption: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
      headline1: TextStyle(
        color: Colors.deepPurple,
        fontSize: 70,
        fontWeight: FontWeight.bold,
        fontFamily: 'Allison',
      ),
      headline2: TextStyle(
        color: Colors.deepOrange,
        fontSize: 25,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.amber,
      // This will control the "back" icon
      iconTheme: IconThemeData(color: Colors.red),
      // This will control action icon buttons that locates on the right
      actionsIconTheme: IconThemeData(color: Colors.blue),
      centerTitle: false,
      elevation: 15,
      titleTextStyle: TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
  );
}

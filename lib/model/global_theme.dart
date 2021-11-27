import 'package:flutter/material.dart';

class GlobalTheme with ChangeNotifier {
  final globalTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 22,
        height: 1.2,
      ),
      bodyText2: TextStyle(
        color: Colors.blue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        height: 1.0,
      ),
      caption: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        height: 1.2,
      ),
      headline1: TextStyle(
        color: Colors.deepPurple,
        fontFamily: 'Allison',
        fontWeight: FontWeight.bold,
        fontSize: 60,
      ),
      headline2: TextStyle(
        color: Colors.black38,
        fontSize: 30,
        fontWeight: FontWeight.bold,
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
        fontFamily: 'Allison',
        fontSize: 40,
      ),
    ),
  );
}

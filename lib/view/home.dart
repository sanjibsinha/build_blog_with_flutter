import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/model/global_theme.dart';
import 'home_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData globalTheme = Provider.of<GlobalTheme>(context).globalTheme;
    final int providedIntegerValue = Provider.of<int>(context);
    final String providedStringValue = Provider.of<String>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: globalTheme,
      home: HomePage(
        homeTheme: globalTheme,
        homeInt: providedIntegerValue,
        homeString: providedStringValue,
      ),
    );
  }
}

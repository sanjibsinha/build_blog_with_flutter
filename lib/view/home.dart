import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/model/global_theme.dart';
import 'home_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData globalTheme = Provider.of<GlobalTheme>(context).globalTheme;
    return MaterialApp(
      title: 'Building Blog',
      theme: globalTheme,
      home: const HomePage(),
    );
  }
}

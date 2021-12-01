import 'package:flutter/material.dart';

import 'home_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final ThemeData globalTheme = Provider.of<GlobalTheme>(context).globalTheme;
    return const MaterialApp(
      title: 'Flutter Demo',
      //theme: globalTheme,
      home: HomePage(),
    );
  }
}

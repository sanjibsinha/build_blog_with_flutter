import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/model/global_theme.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalTheme = Provider.of<GlobalTheme>(context).globalTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: globalTheme,
      home: const HomeAppPage(),
    );
  }
}

class HomeAppPage extends StatelessWidget {
  const HomeAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Testing Global Theme with Provider',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: const HomeAppBody(),
    );
  }
}

class HomeAppBody extends StatelessWidget {
  const HomeAppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          'data',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}

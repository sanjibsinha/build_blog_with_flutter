import 'package:build_blog_with_flutter/model/global_theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Testing Global Theme with Provider',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: const HomeBody(),
    );
  }
}

/// pushing to main now
class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int globalInt = Provider.of<int>(context);
    final String globalString = Provider.of<String>(context);
    final ThemeData globalTheme = Provider.of<GlobalTheme>(context).globalTheme;
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              '$globalInt',
              //style: Theme.of(context).textTheme.bodyText1,
              style: globalTheme.textTheme.bodyText1,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              globalString,
              //style: Theme.of(context).textTheme.bodyText2,
              style: globalTheme.textTheme.bodyText2,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              'Headline 1 theme style again provided by provider',
              //style: Theme.of(context).textTheme.headline2,
              style: globalTheme.textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }
}

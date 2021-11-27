import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final ThemeData homeTheme;
  const HomePage({Key? key, required this.homeTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Testing Global Theme with Provider',
          style: homeTheme.appBarTheme.titleTextStyle,
        ),
      ),
      body: HomeBody(
        homeTheme: homeTheme,
      ),
    );
  }
}

/// pushing to main now
class HomeBody extends StatelessWidget {
  final ThemeData homeTheme;
  const HomeBody({Key? key, required this.homeTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String stringDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              'Headline 2 theme style provided by provider',
              style: homeTheme.textTheme.headline2,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              'Headline 1 theme style provided by provider',
              style: homeTheme.textTheme.headline1,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              'Body Text 2: Here goes some introduction about yourself. Theme by provider.',
              style: homeTheme.textTheme.bodyText2,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              'Body Text 1: Here goes some more information regarding your works. Theme by provider.',
              style: homeTheme.textTheme.bodyText1,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              'Datetime theme style provided by provider: $stringDate',
              style: homeTheme.textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}

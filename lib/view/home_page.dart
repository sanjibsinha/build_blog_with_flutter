import 'package:build_blog_with_flutter/model/blog_post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '/model/global_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeTheme = Provider.of<GlobalTheme>(context).globalTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blog Home Page',
          style: homeTheme.appBarTheme.titleTextStyle,
        ),
      ),

      /// pushing again to test
      body: HomeBody(
        homeTheme: homeTheme,
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  final ThemeData homeTheme;
  const HomeBody({Key? key, required this.homeTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blogPosts = Provider.of<List<BlogPost>>(context);
    return Center(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              'Blog by Clumsy Coder',
              style: homeTheme.textTheme.headline1,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              'I am a clumsy coder who neither can write decent code, nor '
              'can write fiction. But I try to be a good human being.',
              style: homeTheme.textTheme.headline2,
            ),
          ),
        ],
      ),
    );
  }
}

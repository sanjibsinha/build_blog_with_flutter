import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '/model/global_theme.dart';
import '/model/blog_post.dart';

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
              'can write fiction.'
              ' That friction disturbs me a lot. '
              'But I try to be a good human being.',
              style: homeTheme.textTheme.headline2,
            ),
          ),
          const BlogPostHome(),
        ],
      ),
    );
  }
}

class BlogPostHome extends StatelessWidget {
  const BlogPostHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blogPosts = Provider.of<List<BlogPost>>(context);
    return Column(
      children: blogPosts
          .map(
            (e) => BlogPostOutput(
              id: e.id,
              title: e.title,
              date: e.date,
              content: e.content,
            ),
          )
          .toList(),
    );
  }
}

class BlogPostOutput extends StatelessWidget {
  final String id;
  final String title;
  final DateTime date;
  final String content;

  const BlogPostOutput({
    Key? key,
    required this.id,
    required this.title,
    required this.date,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlogDetail(
                  id: id,
                  title: title,
                  date: date,
                  content: content,
                ),
              ),
            );
          },
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class BlogDetail extends StatelessWidget {
  final String id;
  final String title;
  final DateTime date;
  final String content;
  const BlogDetail({
    Key? key,
    required this.id,
    required this.title,
    required this.date,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blogTheme = Provider.of<GlobalTheme>(context).globalTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blog Page',
          style: blogTheme.appBarTheme.titleTextStyle,
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: blogTheme.textTheme.headline1,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              child: Text(
                content,
                textAlign: TextAlign.left,
                style: blogTheme.textTheme.bodyText1,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              child: Text(
                DateFormat('d MMMM y').format(date),
                style: blogTheme.textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

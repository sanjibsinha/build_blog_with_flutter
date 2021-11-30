import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '/model/blog_post.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blog Home Page',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<BlogPost>>(context);
    return Center(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              'Blog by Clumsy Coder',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              'I am a clumsy coder trying to write decent code, and '
              'fiction.'
              ' But there is a friction. '
              'So, I avoid proper diction.',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          for (var post in posts) BlogPostHome(post: post),
        ],
      ),
    );
  }
}

class BlogPostHome extends StatelessWidget {
  final BlogPost post;
  const BlogPostHome({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlogDetail(post: post),
            ),
          );
        },
        child: Text(
          post.title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ]);
  }
}

class BlogDetail extends StatelessWidget {
  final BlogPost post;
  const BlogDetail({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blog Page',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              child: Text(
                post.title,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              child: Text(
                post.content,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              child: Text(
                DateFormat('d MMMM y').format(post.date),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'model/global_theme.dart';
import '/model/blog_post.dart';
import 'view/home.dart';

/// created a new branch 1-how-provider-works
/// created new branch 2-blog-page-with-provider
/// /// created new branch 3-blog-page-with-provider
/// /// created new branch 4-blog-page-with-provider
/// however, it's not working at first
/// Now, it's working with Flexible widget
/// branch future provider simple
///
void main() {
  runApp(
    /// Providers are above [Root App] instead of inside it, so that tests
    /// can use [Root App] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalTheme()),
        FutureProvider<int>(
          create: (context) => Future.value(1),
          initialData: 2,
        ),
        FutureProvider<String>(
          create: (context) => Future.value('Blog Home Page'),
          initialData: '',
        ),
        FutureProvider<List<BlogPost>>(
          create: (context) => Future.value(blogPosts),
          initialData: const [],
          child: const Home(),
        ),
      ],
      child: const Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData globalTheme = Provider.of<GlobalTheme>(context).globalTheme;
    return MaterialApp(
      title: 'FutureProvider Demo',
      theme: globalTheme,
      home: const HomePage(),
    );
  }
}

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
    final blogs = Provider.of<List<BlogPost>>(context);
    final counter = Provider.of<int>(context);
    final blogHead = Provider.of<String>(context);
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              'This comes from Future Provider: $counter',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Text(
              '$blogHead comes from FutureProvider',
              style: Theme.of(context).textTheme.headline1,
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
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Flexible(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: blogs.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: blogs[i],
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogDetail(
                          post: blogs[i],
                        ),
                      ),
                    );
                  },
                  child: Text(blogs[i].title),
                ),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 22 / 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
            ),
          )
        ],
      ),
    );
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

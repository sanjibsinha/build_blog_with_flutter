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
    final blogs = Provider.of<List<BlogPost>>(context);
    return InkWell(
      onTap: () {},
      child: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: blogs.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: blogs[i],
          child: Text(blogs[i].title),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 20 / 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
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

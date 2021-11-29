import 'package:build_blog_with_flutter/model/blog_post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/global_theme.dart';
import 'view/home.dart';

/// created a new branch 1-how-provider-works

void main() {
  runApp(
    /// Providers are above [Root App] instead of inside it, so that tests
    /// can use [Root App] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalTheme()),
        Provider<List<BlogPost>>(
          create: (context) => blogPosts,
        ),
      ],
      child: const Home(),
    ),
  );
}

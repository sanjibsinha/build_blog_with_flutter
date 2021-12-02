import 'package:flutter/foundation.dart';

class BlogPost with ChangeNotifier {
  final String id;
  final String title;
  final DateTime date;
  final String content;

  BlogPost({
    required this.id,
    required this.title,
    required this.date,
    required this.content,
  });
}

final blogPosts = [
  BlogPost(
    id: 'b1',
    title: 'First Post',
    date: DateTime(2020, 1, 2),
    content: 'This is First post. So it is better not to write more.',
  ),
  BlogPost(
    id: 'b2',
    title: 'Second Post',
    date: DateTime(2020, 2, 15),
    content: 'This is Second post. Sorry for the delay in posting.',
  ),
  BlogPost(
    id: 'b3',
    title: 'Third Post',
    date: DateTime(2020, 3, 25),
    content: 'This is Third post. Again delay! Why? Because Words evade me.',
  ),
];

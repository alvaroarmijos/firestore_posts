import 'package:flutter/material.dart';

/// {@template PostsPage}
/// Contains the list of posts
/// {@endtemplate}
class PostsPage extends StatelessWidget {
  /// {@macro PostsPage}
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Posts Page')));
  }
}

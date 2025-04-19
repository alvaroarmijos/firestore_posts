import 'package:firestore_posts/posts/posts.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// {@template MyApp}
/// Contains the Material App
/// {@endtemplate}
class MyApp extends StatelessWidget {
  /// {@macro MyApp}
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Firestore Posts', home: PostsPage());
  }
}

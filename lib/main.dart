import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_posts/firebase_options.dart';
import 'package:firestore_posts/posts/posts.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

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

import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_posts/app/di/di.dart';
import 'package:firestore_posts/app/ui/app_theme.dart';
import 'package:firestore_posts/firebase_options.dart';
import 'package:firestore_posts/posts/cubit/posts_cubit.dart';
import 'package:firestore_posts/posts/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  registerGlobalDeps();

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
    return MaterialApp(
      theme: AppTheme.lightTheme,
      title: 'Firestore Posts',
      home: BlocProvider(
        create: (context) => PostsCubit()..loadPosts(),
        child: const PostsPage(),
      ),
    );
  }
}

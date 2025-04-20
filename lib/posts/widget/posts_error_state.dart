import 'package:flutter/material.dart';

/// {@template PostsErrorState}
/// Shows the content of the Posts page when the user has an error.
/// {@endtemplate}
class PostsErrorState extends StatelessWidget {
  /// {@macro PostsErrorState}
  const PostsErrorState({required this.message, super.key});

  /// Error [message] to be displayed to the user.
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}

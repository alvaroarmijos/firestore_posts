import 'package:firestore_posts/app/ui/ui.dart';
import 'package:firestore_posts/posts/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:posts_repository/posts_repository.dart';

/// {@template PostsList}
/// Content of Posts Page
/// {@endtemplate}
class PostsList extends StatelessWidget {
  /// {@macro PostsList}
  const PostsList({
    required this.posts,
    required this.loadingNewData,
    super.key,
    this.onScrollEndNotification,
  });

  /// List of posts.
  final List<Post> posts;

  /// Whether loading new data.
  final bool loadingNewData;

  /// on scroll end action
  final VoidCallback? onScrollEndNotification;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollEndNotification &&
                  notification.metrics.extentAfter == 0) {
                // User has reached the end of the list
                // Load more data
                onScrollEndNotification?.call();
              }
              return false;
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.space8),
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                final post = posts[index];
                return PostTile(post: post);
              },
            ),
          ),
          if (loadingNewData)
            const Align(
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

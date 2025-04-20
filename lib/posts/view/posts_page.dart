import 'package:firestore_posts/posts/cubit/posts_cubit.dart';
import 'package:firestore_posts/posts/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template PostsPage}
/// Contains the list of posts
/// {@endtemplate}
class PostsPage extends StatelessWidget {
  /// {@macro PostsPage}
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          return switch (state) {
            PostsLoadingState() => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            PostsUserErrorState(:final message) => PostsErrorState(
              message: message,
            ),
            PostsLoadedState(:final posts, :final loadingMoreData) => PostsList(
              posts: posts,
              loadingNewData: loadingMoreData,
              onScrollEndNotification:
                  () => context.read<PostsCubit>().loadPosts(),
            ),
          };
        },
      ),
    );
  }
}

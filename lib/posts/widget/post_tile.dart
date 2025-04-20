import 'package:firestore_posts/app/ui/ui.dart';
import 'package:firestore_posts/posts/cubit/posts_cubit.dart';
import 'package:firestore_posts/posts/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_repository/posts_repository.dart';

/// {@template PostTile}
/// Post tile with author, content and options to like/dislike.
/// {@endtemplate}
class PostTile extends StatelessWidget {
  /// {@macro PostTile}
  const PostTile({required this.post, super.key});

  /// Post to show the information.
  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final postsCubit = context.read<PostsCubit>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.space8,
          children: [
            Text(post.author, style: textTheme.titleMedium),
            Text(post.content),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PostAction.like(
                  value: post.likes,
                  currentVote: post.userVote,
                  onTap: () => postsCubit.updateLikes(post),
                ),
                PostAction.dislike(
                  value: post.dislikes,
                  currentVote: post.userVote,
                  onTap: () => postsCubit.updateDislikes(post),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

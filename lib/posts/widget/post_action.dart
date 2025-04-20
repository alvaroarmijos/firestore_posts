import 'package:firestore_posts/app/ui/ui.dart';
import 'package:firestore_posts/posts/enums/action_type.dart';
import 'package:flutter/material.dart';
import 'package:posts_repository/posts_repository.dart';

/// {@template PostAction}
/// Contains the information of likes or dislikes
/// {@endtemplate}
class PostAction extends StatelessWidget {
  /// Creates a like action.
  const PostAction.like({
    required this.value,
    required this.currentVote,
    super.key,
    this.onTap,
  }) : type = ActionType.like;

  /// Creates a dislike action.
  const PostAction.dislike({
    required this.value,
    required this.currentVote,
    super.key,
    this.onTap,
  }) : type = ActionType.dislike;

  /// Callback when the action is tapped.
  final VoidCallback? onTap;

  /// Title to display.
  final ActionType type;

  /// Value to display.
  final int value;

  /// Current user vote.
  final UserVote currentVote;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final (icon, color) = switch (type) {
      ActionType.like => (
        AppAssets.like,
        currentVote == UserVote.like ? colorScheme.primary : null,
      ),
      ActionType.dislike => (
        AppAssets.dislike,
        currentVote == UserVote.dislike ? colorScheme.secondary : null,
      ),
    };

    return InkWell(
      borderRadius: BorderRadius.circular(AppSpacing.space4),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(icon, width: AppSpacing.space20, color: color),
            const SizedBox(width: AppSpacing.space4),
            Text(
              value.toString(),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

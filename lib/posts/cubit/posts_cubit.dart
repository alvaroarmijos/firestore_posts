import 'package:firestore_posts/app/di/di.dart';
import 'package:firestore_posts/posts/enums/action_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:posts_repository/posts_repository.dart';

part 'posts_cubit.freezed.dart';
part 'posts_state.dart';

/// {@template PostsCubit}
/// Cubit for the posts.
/// {@endtemplate}
class PostsCubit extends Cubit<PostsState> {
  /// {@macro PostsCubit}
  PostsCubit() : super(const PostsLoadingState());

  final _postsRepository = getIt<PostsRepository>();

  /// Load available posts
  Future<void> loadPosts() async {
    try {
      final state = this.state;
      if (state is PostsLoadedState) {
        if (!state.canLoadMoreData || state.loadingMoreData) return;

        emit(state.copyWith(loadingMoreData: true));

        final latestTimestamp = state.posts.last.timestamp;
        final posts = await _postsRepository.getPosts(latestTimestamp);
        final canLoadMoreData = posts.length == 30;

        emit(
          state.copyWith(
            posts: [...state.posts, ...posts],
            loadingMoreData: false,
            canLoadMoreData: canLoadMoreData,
          ),
        );
      } else {
        final initialPosts = await _postsRepository.getPosts(0);
        final canLoadMoreData = initialPosts.length == 30;
        emit(
          PostsLoadedState(
            posts: initialPosts,
            canLoadMoreData: canLoadMoreData,
          ),
        );
      }
    } on PostsFailure catch (_) {
      emit(const PostsState.error('Error while loading posts'));
    } catch (error, _) {
      emit(PostsState.error(error.toString()));
    }
  }

  /// Updates the likes of the post
  Future<void> updateLikes(Post post) async {
    final state = this.state;
    if (state is PostsLoadedState) {
      try {
        final newPost = _updatePost(post, ActionType.like);

        _updatePostsList(newPost);

        await _postsRepository.updatePostVotes(
          newPost.id,
          newPost.likes,
          newPost.dislikes,
        );
      } on VoteFailure catch (_) {
        emit(const PostsState.error('Error while updating post likes'));
      } catch (error, _) {
        emit(PostsState.error(error.toString()));
      }
    }
  }

  /// Updates the dislikes of the post
  Future<void> updateDislikes(Post post) async {
    final state = this.state;
    if (state is PostsLoadedState) {
      try {
        final newPost = _updatePost(post, ActionType.dislike);

        // Update the local list of posts
        _updatePostsList(newPost);

        await _postsRepository.updatePostVotes(
          newPost.id,
          newPost.likes,
          newPost.dislikes,
        );
      } on VoteFailure catch (_) {
        emit(const PostsState.error('Error while updating post dislikes'));
      } catch (error, _) {
        emit(PostsState.error(error.toString()));
      }
    }
  }

  Post _updatePost(Post post, ActionType action) {
    final previousVote = post.userVote;
    late final UserVote newVote;

    // Determine the new vote
    if (action == ActionType.like) {
      newVote = previousVote == UserVote.like ? UserVote.none : UserVote.like;
    } else {
      newVote =
          previousVote == UserVote.dislike ? UserVote.none : UserVote.dislike;
    }

    var likes = post.likes;
    var dislikes = post.dislikes;

    // Update counts
    if (previousVote == UserVote.like) likes--;
    if (previousVote == UserVote.dislike) dislikes--;

    if (newVote == UserVote.like) likes++;
    if (newVote == UserVote.dislike) dislikes++;

    return post.copyWith(userVote: newVote, likes: likes, dislikes: dislikes);
  }

  void _updatePostsList(Post newPost) {
    final state = this.state;
    if (state is PostsLoadedState) {
      final updatedPosts =
          state.posts.map((post) {
            return post.id == newPost.id
                ? post.copyWith(
                  userVote: newPost.userVote,
                  dislikes: newPost.dislikes,
                  likes: newPost.likes,
                )
                : post;
          }).toList();

      emit(state.copyWith(posts: updatedPosts));
    }
  }
}

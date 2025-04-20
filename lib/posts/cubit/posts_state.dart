part of 'posts_cubit.dart';

@freezed
/// Posts state class.
sealed class PostsState with _$PostsState {
  /// Posts Page Loading state.
  const factory PostsState.loading() = PostsLoadingState;

  /// Posts Page Loaded state.
  const factory PostsState.loaded({
    @Default([]) List<Post> posts,
    @Default(false) bool loadingMoreData,
    @Default(true) bool canLoadMoreData,
  }) = PostsLoadedState;

  /// Posts Page error state
  const factory PostsState.error(String message) = PostsUserErrorState;
}

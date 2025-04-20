import 'package:bloc_test/bloc_test.dart';
import 'package:firestore_posts/posts/cubit/posts_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posts_repository/posts_repository.dart';

import '../../app/test_data.dart';
import '../../mocks/mock_posts_repository.dart';

void main() {
  late MockPostsRepository postsRepository;

  setUpAll(() {
    postsRepository = MockPostsRepository();

    GetIt.I.registerSingleton<PostsRepository>(postsRepository);
  });
  tearDownAll(() {
    GetIt.I.reset();
  });

  group('Load Posts', () {
    blocTest<PostsCubit, PostsState>(
      'emits [PostsState.loaded] when loadPosts is called with the initial timestamp.',
      build: PostsCubit.new,
      setUp: () {
        postsRepository.mockPosts(TestData.posts1);
      },
      act: (cubit) => cubit.loadPosts(),
      expect:
          () => <PostsState>[
            PostsLoadedState(posts: TestData.posts1, canLoadMoreData: false),
          ],
    );

    blocTest<PostsCubit, PostsState>(
      'emits [PostsState.loaded] when loadPosts is called with the latest timestamp.',
      build: PostsCubit.new,
      seed: () => PostsLoadedState(posts: TestData.posts1),
      setUp: () {
        postsRepository.mockPosts(TestData.posts2);
      },
      act: (cubit) => cubit.loadPosts(),
      expect:
          () => <PostsState>[
            PostsLoadedState(posts: TestData.posts1, loadingMoreData: true),
            PostsLoadedState(
              posts: [...TestData.posts1, ...TestData.posts2],
              canLoadMoreData: false,
            ),
          ],
    );

    blocTest<PostsCubit, PostsState>(
      'emits [PostsState.error] when loadPosts is called with PostsFailure.',
      build: PostsCubit.new,
      setUp: () {
        postsRepository.mockException(PostsFailure());
      },
      act: (cubit) => cubit.loadPosts(),
      expect:
          () => <PostsState>[
            const PostsState.error('Error while loading posts'),
          ],
    );

    blocTest<PostsCubit, PostsState>(
      'emits [PostsState.error] when loadPosts is called with Exception.',
      build: PostsCubit.new,
      setUp: () {
        postsRepository.mockException(Exception());
      },
      act: (cubit) => cubit.loadPosts(),
      expect: () => <PostsState>[PostsState.error(Exception().toString())],
    );
  });

  group('Update likes', () {
    blocTest<PostsCubit, PostsState>(
      'emits [PostsState.loaded] when updateLikes is called.',
      build: PostsCubit.new,
      setUp: () => postsRepository.mockVotes(),
      seed: () => PostsLoadedState(posts: TestData.posts1),
      act: (cubit) => cubit.updateLikes(TestData.posts1.first),
      expect:
          () => <PostsState>[
            PostsLoadedState(
              posts: [
                TestData.posts1.first.copyWith(
                  likes: 2,
                  userVote: UserVote.like,
                ),
                TestData.posts1.last,
              ],
            ),
          ],
      verify: (bloc) {
        verify(() => postsRepository.updatePostVotes('id1', 2, 0)).called(1);
      },
    );

    blocTest<PostsCubit, PostsState>(
      'emits [PostsState.error] when updateLikes is called with VoteFailure.',
      build: PostsCubit.new,
      seed: () => PostsLoadedState(posts: TestData.posts1),
      setUp: () {
        postsRepository.mockVoteException(VoteFailure());
      },
      act: (cubit) => cubit.updateLikes(TestData.posts1.first),
      expect:
          () => <PostsState>[
            PostsLoadedState(
              posts: [
                TestData.posts1.first.copyWith(
                  likes: 2,
                  userVote: UserVote.like,
                ),
                TestData.posts1.last,
              ],
            ),
            const PostsState.error('Error while updating post likes'),
          ],
    );

    blocTest<PostsCubit, PostsState>(
      'emits [PostsState.error] when updateLikes is called with Exception.',
      build: PostsCubit.new,
      seed: () => PostsLoadedState(posts: TestData.posts1),
      setUp: () {
        postsRepository.mockVoteException(Exception());
      },
      act: (cubit) => cubit.updateLikes(TestData.posts1.first),
      expect:
          () => <PostsState>[
            PostsLoadedState(
              posts: [
                TestData.posts1.first.copyWith(
                  likes: 2,
                  userVote: UserVote.like,
                ),
                TestData.posts1.last,
              ],
            ),
            PostsState.error(Exception().toString()),
          ],
    );
  });

  group('Update dislikes', () {
    blocTest<PostsCubit, PostsState>(
      'emits [PostsState.loaded] when updateDislikes is called.',
      build: PostsCubit.new,
      seed: () => PostsLoadedState(posts: TestData.posts1),
      setUp: () => postsRepository.mockVotes(),
      act: (cubit) => cubit.updateDislikes(TestData.posts1.first),
      expect:
          () => <PostsState>[
            PostsLoadedState(
              posts: [
                TestData.posts1.first.copyWith(
                  dislikes: 1,
                  userVote: UserVote.dislike,
                ),
                TestData.posts1.last,
              ],
            ),
          ],
      verify: (bloc) {
        verify(() => postsRepository.updatePostVotes('id1', 1, 1)).called(1);
      },
    );

    blocTest<PostsCubit, PostsState>(
      'emits [PostsState.error] when updateDislikes is called with VoteFailure.',
      build: PostsCubit.new,
      seed: () => PostsLoadedState(posts: TestData.posts1),
      setUp: () {
        postsRepository.mockVoteException(VoteFailure());
      },
      act: (cubit) => cubit.updateDislikes(TestData.posts1.first),
      expect:
          () => <PostsState>[
            PostsLoadedState(
              posts: [
                TestData.posts1.first.copyWith(
                  dislikes: 1,
                  userVote: UserVote.dislike,
                ),
                TestData.posts1.last,
              ],
            ),
            const PostsState.error('Error while updating post dislikes'),
          ],
    );

    blocTest<PostsCubit, PostsState>(
      'emits [PostsState.error] when updateDislikes is called with Exception.',
      build: PostsCubit.new,
      seed: () => PostsLoadedState(posts: TestData.posts1),
      setUp: () {
        postsRepository.mockVoteException(Exception());
      },
      act: (cubit) => cubit.updateDislikes(TestData.posts1.first),
      expect:
          () => <PostsState>[
            PostsLoadedState(
              posts: [
                TestData.posts1.first.copyWith(
                  dislikes: 1,
                  userVote: UserVote.dislike,
                ),
                TestData.posts1.last,
              ],
            ),
            PostsState.error(Exception().toString()),
          ],
    );
  });
}

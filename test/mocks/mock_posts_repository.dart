import 'package:mocktail/mocktail.dart';
import 'package:posts_repository/posts_repository.dart';

class MockPostsRepository extends Mock implements PostsRepository {
  MockPostsRepository() {
    mockVotes();
  }

  void mockVotes() {
    when(
      () => updatePostVotes(any(), any(), any()),
    ).thenAnswer((_) async => () {});
  }

  void mockPosts(List<Post> posts) {
    when(() => getPosts(any())).thenAnswer((_) async => posts);
  }

  void mockException(Exception exception) {
    when(() => getPosts(any())).thenThrow(exception);
  }

  void mockVoteException(Exception exception) {
    when(() => updatePostVotes(any(), any(), any())).thenThrow(exception);
  }
}

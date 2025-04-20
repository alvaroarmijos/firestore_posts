import 'package:posts_repository/src/models/post.dart';

/// Contract that defines the methods to interact with the
/// posts repository.
abstract class PostsRepositoryContract {
  /// Future with all posts in firestore.
  Future<List<Post>> getPosts(int startAfterTimestamp);

  /// Updates post likes/dislikes in Firebase.
  Future<void> updatePostVotes(
    String postId,
    int likes,
    int dislikes,
  );
}

import 'package:posts_repository/src/enums/post_status.dart';
import 'package:posts_repository/src/models/post.dart';

/// Contract that defines the methods to interact with the
/// posts repository.
abstract class PostsRepositoryContract {
  /// Future with all the posts in firestore.
  Future<List<Post>> getPosts();

  /// Updates post likes in Firebase.
  Future<PostStatus> updatePostLikes(
    String postId,
    int likes,
  );

  /// Updates post dislikes in Firebase.
  Future<PostStatus> updatePostDislikes(
    String postId,
    int dislikes,
  );
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:posts_repository/src/contract/posts_repository_contract.dart';
import 'package:posts_repository/src/exceptions/post.dart';
import 'package:posts_repository/src/models/post.dart';

/// {@template posts_repository}
/// Manages interaction with Firebase
///
/// Receives an instance of [FirebaseFirestore]
/// {@endtemplate}
class PostsRepository extends PostsRepositoryContract {
  /// {@macro posts_repository}
  PostsRepository({
    FirebaseFirestore? firestore,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _postsCollection = (firestore ?? FirebaseFirestore.instance)
            .collection(_postsCollectionPath)
            .withConverter(
              fromFirestore: _postsFromFirestore,
              toFirestore: _postsToFirestore,
            );

  static const _postsCollectionPath = 'posts';

  final FirebaseFirestore _firestore;
  final CollectionReference<Post> _postsCollection;

  static Post _postsFromFirestore(
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot,
    SnapshotOptions? _,
  ) =>
      Post.fromJson(
        documentSnapshot.data()!..addAll({'id': documentSnapshot.id}),
      );

  static Map<String, dynamic> _postsToFirestore(
    Post post,
    SetOptions? _,
  ) {
    return post.toJson()
      ..remove('id')
      ..remove('userVote');
  }

  @override
  Future<List<Post>> getPosts(int startAfterTimestamp) async {
    var query = _postsCollection.orderBy('timestamp', descending: true);

    if (startAfterTimestamp > 0) {
      query = query.startAfter([startAfterTimestamp]);
    }

    final snapshot = await query.limit(30).get();
    return _snapshotToList(snapshot);
  }

  List<T> _snapshotToList<T>(QuerySnapshot<T> snapshot) {
    try {
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (_) {
      throw PostsFailure();
    }
  }

  @override
  Future<void> updatePostVotes(String postId, int likes, int dislikes) async {
    try {
      final docReference = _firestore.collection('posts').doc(postId);

      await docReference.set(
        {
          'likes': likes,
          'dislikes': dislikes,
        },
        SetOptions(merge: true),
      );
    } catch (_) {
      throw VoteFailure();
    }
  }
}

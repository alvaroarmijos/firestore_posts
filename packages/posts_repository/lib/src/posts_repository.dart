import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:posts_repository/src/contract/posts_repository_contract.dart';
import 'package:posts_repository/src/enums/post_status.dart';
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
    return post.toJson()..remove('id');
  }

  @override
  Future<List<Post>> getPosts() async {
    return _postsCollection.get().then(_snapshotToList);
  }

  List<T> _snapshotToList<T>(QuerySnapshot<T> snapshot) {
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<PostStatus> updatePostDislikes(String postId, int dislikes) async {
    try {
      final docReference = _firestore.collection('users').doc(postId);

      await docReference.set(
        {'dislikes': dislikes},
        SetOptions(merge: true),
      );

      return PostStatus.updated;
    } catch (_) {
      return PostStatus.error;
    }
  }

  @override
  Future<PostStatus> updatePostLikes(String postId, int likes) async {
    try {
      final docReference = _firestore.collection('users').doc(postId);

      await docReference.set(
        {'likes': likes},
        SetOptions(merge: true),
      );

      return PostStatus.updated;
    } catch (_) {
      return PostStatus.error;
    }
  }
}

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed

/// {@template Post}
/// Contains the information about a post
/// {@endtemplate}
abstract class Post with _$Post {
  /// {@macro Post}
  factory Post({
    required String id,
    required String author,
    required String content,
    required int likes,
    required int dislikes,
  }) = _Post;

  /// Creates a new instance of [Post] from a JSON object.
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

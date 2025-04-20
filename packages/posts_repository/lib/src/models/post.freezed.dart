// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Post {
  String get id;
  String get author;
  String get content;
  int get likes;
  int get dislikes;
  int get timestamp;
  UserVote get userVote;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostCopyWith<Post> get copyWith =>
      _$PostCopyWithImpl<Post>(this as Post, _$identity);

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Post &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.dislikes, dislikes) ||
                other.dislikes == dislikes) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.userVote, userVote) ||
                other.userVote == userVote));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, author, content, likes, dislikes, timestamp, userVote);

  @override
  String toString() {
    return 'Post(id: $id, author: $author, content: $content, likes: $likes, dislikes: $dislikes, timestamp: $timestamp, userVote: $userVote)';
  }
}

/// @nodoc
abstract mixin class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) _then) =
      _$PostCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String author,
      String content,
      int likes,
      int dislikes,
      int timestamp,
      UserVote userVote});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._self, this._then);

  final Post _self;
  final $Res Function(Post) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? content = null,
    Object? likes = null,
    Object? dislikes = null,
    Object? timestamp = null,
    Object? userVote = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _self.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      dislikes: null == dislikes
          ? _self.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      userVote: null == userVote
          ? _self.userVote
          : userVote // ignore: cast_nullable_to_non_nullable
              as UserVote,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Post implements Post {
  _Post(
      {required this.id,
      required this.author,
      required this.content,
      required this.likes,
      required this.dislikes,
      required this.timestamp,
      this.userVote = UserVote.none});
  factory _Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  @override
  final String id;
  @override
  final String author;
  @override
  final String content;
  @override
  final int likes;
  @override
  final int dislikes;
  @override
  final int timestamp;
  @override
  @JsonKey()
  final UserVote userVote;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Post &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.dislikes, dislikes) ||
                other.dislikes == dislikes) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.userVote, userVote) ||
                other.userVote == userVote));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, author, content, likes, dislikes, timestamp, userVote);

  @override
  String toString() {
    return 'Post(id: $id, author: $author, content: $content, likes: $likes, dislikes: $dislikes, timestamp: $timestamp, userVote: $userVote)';
  }
}

/// @nodoc
abstract mixin class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) _then) =
      __$PostCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String author,
      String content,
      int likes,
      int dislikes,
      int timestamp,
      UserVote userVote});
}

/// @nodoc
class __$PostCopyWithImpl<$Res> implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(this._self, this._then);

  final _Post _self;
  final $Res Function(_Post) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? content = null,
    Object? likes = null,
    Object? dislikes = null,
    Object? timestamp = null,
    Object? userVote = null,
  }) {
    return _then(_Post(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _self.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      dislikes: null == dislikes
          ? _self.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      userVote: null == userVote
          ? _self.userVote
          : userVote // ignore: cast_nullable_to_non_nullable
              as UserVote,
    ));
  }
}

// dart format on

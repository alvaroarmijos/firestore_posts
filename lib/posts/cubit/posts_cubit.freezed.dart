// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostsState()';
}


}

/// @nodoc
class $PostsStateCopyWith<$Res>  {
$PostsStateCopyWith(PostsState _, $Res Function(PostsState) __);
}


/// @nodoc


class PostsLoadingState implements PostsState {
  const PostsLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostsState.loading()';
}


}




/// @nodoc


class PostsLoadedState implements PostsState {
  const PostsLoadedState({final  List<Post> posts = const [], this.loadingMoreData = false, this.canLoadMoreData = true}): _posts = posts;
  

 final  List<Post> _posts;
@JsonKey() List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

@JsonKey() final  bool loadingMoreData;
@JsonKey() final  bool canLoadMoreData;

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostsLoadedStateCopyWith<PostsLoadedState> get copyWith => _$PostsLoadedStateCopyWithImpl<PostsLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsLoadedState&&const DeepCollectionEquality().equals(other._posts, _posts)&&(identical(other.loadingMoreData, loadingMoreData) || other.loadingMoreData == loadingMoreData)&&(identical(other.canLoadMoreData, canLoadMoreData) || other.canLoadMoreData == canLoadMoreData));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts),loadingMoreData,canLoadMoreData);

@override
String toString() {
  return 'PostsState.loaded(posts: $posts, loadingMoreData: $loadingMoreData, canLoadMoreData: $canLoadMoreData)';
}


}

/// @nodoc
abstract mixin class $PostsLoadedStateCopyWith<$Res> implements $PostsStateCopyWith<$Res> {
  factory $PostsLoadedStateCopyWith(PostsLoadedState value, $Res Function(PostsLoadedState) _then) = _$PostsLoadedStateCopyWithImpl;
@useResult
$Res call({
 List<Post> posts, bool loadingMoreData, bool canLoadMoreData
});




}
/// @nodoc
class _$PostsLoadedStateCopyWithImpl<$Res>
    implements $PostsLoadedStateCopyWith<$Res> {
  _$PostsLoadedStateCopyWithImpl(this._self, this._then);

  final PostsLoadedState _self;
  final $Res Function(PostsLoadedState) _then;

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,Object? loadingMoreData = null,Object? canLoadMoreData = null,}) {
  return _then(PostsLoadedState(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,loadingMoreData: null == loadingMoreData ? _self.loadingMoreData : loadingMoreData // ignore: cast_nullable_to_non_nullable
as bool,canLoadMoreData: null == canLoadMoreData ? _self.canLoadMoreData : canLoadMoreData // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class PostsUserErrorState implements PostsState {
  const PostsUserErrorState(this.message);
  

 final  String message;

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostsUserErrorStateCopyWith<PostsUserErrorState> get copyWith => _$PostsUserErrorStateCopyWithImpl<PostsUserErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsUserErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PostsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PostsUserErrorStateCopyWith<$Res> implements $PostsStateCopyWith<$Res> {
  factory $PostsUserErrorStateCopyWith(PostsUserErrorState value, $Res Function(PostsUserErrorState) _then) = _$PostsUserErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PostsUserErrorStateCopyWithImpl<$Res>
    implements $PostsUserErrorStateCopyWith<$Res> {
  _$PostsUserErrorStateCopyWithImpl(this._self, this._then);

  final PostsUserErrorState _self;
  final $Res Function(PostsUserErrorState) _then;

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PostsUserErrorState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

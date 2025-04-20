// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Post _$PostFromJson(Map<String, dynamic> json) => _Post(
      id: json['id'] as String,
      author: json['author'] as String,
      content: json['content'] as String,
      likes: (json['likes'] as num).toInt(),
      dislikes: (json['dislikes'] as num).toInt(),
      timestamp: (json['timestamp'] as num).toInt(),
      userVote: $enumDecodeNullable(_$UserVoteEnumMap, json['userVote']) ??
          UserVote.none,
    );

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'content': instance.content,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'timestamp': instance.timestamp,
      'userVote': _$UserVoteEnumMap[instance.userVote]!,
    };

const _$UserVoteEnumMap = {
  UserVote.like: 'like',
  UserVote.dislike: 'dislike',
  UserVote.none: 'none',
};

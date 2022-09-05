// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anime _$AnimeFromJson(Map<String, dynamic> json) => Anime(
      json['id'] as int,
      json['author'] as String,
      json['cover'] as String,
      json['name'] as String,
      (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      (json['score'] as num).toDouble(),
      json['release'] as String,
      json['introduction'] as String,
      (json['poster'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AnimeToJson(Anime instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'tags': instance.tags,
      'release': instance.release,
      'score': instance.score,
      'introduction': instance.introduction,
      'cover': instance.cover,
      'poster': instance.poster,
    };

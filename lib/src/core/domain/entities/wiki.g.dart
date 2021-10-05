// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wiki.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wiki _$WikiFromJson(Map<String, dynamic> json) {
  return Wiki(
    published: json['published'] as String,
    content: json['content'] as String?,
    summary: json['summary'] as String,
  );
}

Map<String, dynamic> _$WikiToJson(Wiki instance) => <String, dynamic>{
      'published': instance.published,
      'summary': instance.summary,
      'content': instance.content,
    };

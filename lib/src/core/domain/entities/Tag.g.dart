// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

BaseTags _$BaseTagsFromJson(Map<String, dynamic> json) {
  return BaseTags(
    tag: (json['tag'] as List<dynamic>).map((e) => Tag.fromJson(e)).toList(),
  );
}

Map<String, dynamic> _$BaseTagsToJson(BaseTags instance) => <String, dynamic>{
      'tag': instance.tag,
    };

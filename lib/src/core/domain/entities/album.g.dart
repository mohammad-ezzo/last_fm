// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album(
    title: json['title'] as String,
    url: json['url'] as String,
    mbid: json['mbid'] as String?,
    artist: json['artist'] as String?,
    image: (json['image'] as List<dynamic>?)
        ?.map((e) => TrackImage.fromJson(e))
        .toList(),
  );
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'mbid': instance.mbid,
      'artist': instance.artist,
      'image': instance.image,
    };

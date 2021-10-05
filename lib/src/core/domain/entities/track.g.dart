// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) {
  return Track(
    name: json['name'] as String,
    artist: Track.artistFromJson(json['artist']),
    wiki: json['wiki'] == null ? null : Wiki.fromJson(json['wiki']),
    url: json['url'] as String?,
    listeners: json['listeners'] as String,
    mbid: json['mbid'] as String?,
    image: (json['image'] as List<dynamic>?)
        ?.map((e) => TrackImage.fromJson(e))
        .toList(),
    album: json['album'] == null ? null : Album.fromJson(json['album']),
    duration: json['duration'] as String?,
    playcount: json['playcount'] as String?,
    toptags:
        json['toptags'] == null ? null : BaseTags.fromJson(json['toptags']),
  );
}

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'listeners': instance.listeners,
      'mbid': instance.mbid,
      'image': instance.image,
      'duration': instance.duration,
      'playcount': instance.playcount,
      'wiki': instance.wiki,
      'artist': instance.artist,
      'album': instance.album,
      'toptags': instance.toptags,
    };

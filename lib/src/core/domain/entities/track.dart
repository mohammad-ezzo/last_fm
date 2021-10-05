import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:last_fm/src/core/domain/entities/Tag.dart';
import 'package:last_fm/src/core/domain/entities/album.dart';
import 'package:last_fm/src/core/domain/entities/track_image.dart';
import 'package:last_fm/src/core/domain/entities/wiki.dart';

import 'artist.dart';
import 'dart:developer' as dev;
part 'track.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Track {
  final String name;

  final String? url;
  final String listeners;
  final String? mbid;
  final List<TrackImage>? image;
  final String? duration;
  final String? playcount;
  final Wiki? wiki;
  @JsonKey(fromJson: artistFromJson)
  final dynamic artist;
  final Album? album;

  final BaseTags? toptags;

  Track(
      {required this.name,
      this.artist,
      this.wiki,
      required this.url,
      required this.listeners,
      required this.mbid,
      required this.image,
      this.album,
      this.duration,
      this.playcount,
      this.toptags});

  factory Track.fromJson(json) => _$TrackFromJson(json);
  toJson() => _$TrackToJson(this);

  static List<Track> fromJsonList(List json) {
    return json.map((e) => Track.fromJson(e)).toList();
  }

  static artistFromJson(json) {
    if (json != null && json is String) {
      return json;
    } else {
      return Artist.fromJson(json);
    }
  }
}

import 'package:json_annotation/json_annotation.dart';
import 'package:last_fm/src/core/domain/entities/track_image.dart';

part 'album.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Album {
  final String title;
  final String url;
  final String? mbid;
  final String? artist;
  final List<TrackImage>? image;
  Album({
    required this.title,
    required this.url,
    required this.mbid,
    required this.artist,
    required this.image,
  });

  factory Album.fromJson(json) => _$AlbumFromJson(json);
  toJson() => _$AlbumToJson(this);

  static List<Album> fromJsonList(List json) {
    return json.map((e) => Album.fromJson(e)).toList();
  }
}

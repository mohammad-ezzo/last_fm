import 'package:json_annotation/json_annotation.dart';

part 'artist.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Artist {
  final String name;
  final String url;
  final String? mbid;

  Artist({
    required this.name,
    required this.url,
    required this.mbid,
  });

  factory Artist.fromJson(json) => _$ArtistFromJson(json);
  toJson() => _$ArtistToJson(this);

  static List<Artist> fromJsonList(List json) {
    return json.map((e) => Artist.fromJson(e)).toList();
  }
}

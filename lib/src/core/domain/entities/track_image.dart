import 'package:json_annotation/json_annotation.dart';

part 'track_image.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TrackImage {
  @JsonKey(name: "#text")
  final String text;
  final String size;

  TrackImage({
    required this.text,
    required this.size,
  });

  factory TrackImage.fromJson(json) => _$TrackImageFromJson(json);
  toJson() => _$TrackImageToJson(this);

  static List<TrackImage> fromJsonList(List json) {
    return json.map((e) => TrackImage.fromJson(e)).toList();
  }
}

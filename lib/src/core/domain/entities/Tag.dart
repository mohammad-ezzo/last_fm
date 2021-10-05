import 'package:json_annotation/json_annotation.dart';

part 'Tag.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Tag {
  final String name;
  final String url;

  Tag({
    required this.name,
    required this.url,
  });

  factory Tag.fromJson(json) => _$TagFromJson(json);
  toJson() => _$TagToJson(this);

  static List<Tag> fromJsonList(List json) {
    return json.map((e) => Tag.fromJson(e)).toList();
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BaseTags {
  final List<Tag> tag;

  BaseTags({
    required this.tag,
  });

  factory BaseTags.fromJson(json) => _$BaseTagsFromJson(json);
  toJson() => _$BaseTagsToJson(this);
}

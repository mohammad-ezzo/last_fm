import 'package:json_annotation/json_annotation.dart';

part 'wiki.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Wiki {
  final String published;
  final String summary;
  final String? content;

  Wiki({
    required this.published,
    required this.content,
    required this.summary,
  });

  factory Wiki.fromJson(json) => _$WikiFromJson(json);
  toJson() => _$WikiToJson(this);

  static List<Wiki> fromJsonList(List json) {
    return json.map((e) => Wiki.fromJson(e)).toList();
  }
}

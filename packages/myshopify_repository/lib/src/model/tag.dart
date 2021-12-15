import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Tag {
  String? name;

  Tag({
    this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

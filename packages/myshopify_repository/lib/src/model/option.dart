import 'package:json_annotation/json_annotation.dart';

part 'option.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Option {
  int? id;
  int? productId;
  String? name;
  int? position;
  List<String>? values;

  Option({
    this.id,
    this.productId,
    this.name,
    this.position,
    this.values,
  });

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}

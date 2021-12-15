import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Image {
  int? id;
  int? productId;
  int? position;
  String? createdAt;
  String? updatedAt;
  int? width;
  int? height;
  String? src;
  String? adminGraphqlApiId;

  Image({
    this.id,
    this.productId,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.width,
    this.height,
    this.src,
    this.adminGraphqlApiId,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

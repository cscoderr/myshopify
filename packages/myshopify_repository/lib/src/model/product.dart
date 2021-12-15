import 'package:json_annotation/json_annotation.dart';
import 'package:myshopify_repository/src/model/model.dart';

part 'product.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Product {
  int? id;
  String? title;
  String? bodyHtml;
  String? vendor;
  String? productType;
  String? createdAt;
  String? handle;
  String? updatedAt;
  String? publishedAt;
  String? status;
  String? tags;
  String? adminGraphqlApiId;
  List<Variant>? variants;
  List<Option>? options;
  List<Image>? images;
  Image? image;

  Product({
    this.id,
    this.title,
    this.bodyHtml,
    this.vendor,
    this.productType,
    this.createdAt,
    this.handle,
    this.updatedAt,
    this.publishedAt,
    this.status,
    this.tags,
    this.adminGraphqlApiId,
    this.variants,
    this.options,
    this.images,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

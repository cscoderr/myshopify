import 'package:json_annotation/json_annotation.dart';

part 'variant.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Variant {
  int? id;
  int? productId;
  String? title;
  String? price;
  String? sku;
  int? position;
  String? option1;
  String? createdAt;
  String? updatedAt;
  bool? taxable;
  int? grams;
  double? weight;
  int? inventoryItemId;
  int? inventoryQuantity;
  int? oldInventoryQuantity;
  bool? requiresShipping;
  String? adminGraphqlApiId;

  Variant({
    this.id,
    this.productId,
    this.title,
    this.price,
    this.sku,
    this.position,
    this.option1,
    this.createdAt,
    this.taxable,
    this.updatedAt,
    this.grams,
    this.weight,
    this.inventoryItemId,
    this.inventoryQuantity,
    this.oldInventoryQuantity,
    this.requiresShipping,
    this.adminGraphqlApiId,
  });

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);
}

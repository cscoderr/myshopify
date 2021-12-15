// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variant _$VariantFromJson(Map<String, dynamic> json) => Variant(
      id: json['id'] as int?,
      productId: json['product_id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as String?,
      sku: json['sku'] as String?,
      position: json['position'] as int?,
      option1: json['option1'] as String?,
      createdAt: json['created_at'] as String?,
      taxable: json['taxable'] as bool?,
      updatedAt: json['updated_at'] as String?,
      grams: json['grams'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      inventoryItemId: json['inventory_item_id'] as int?,
      inventoryQuantity: json['inventory_quantity'] as int?,
      oldInventoryQuantity: json['old_inventory_quantity'] as int?,
      requiresShipping: json['requires_shipping'] as bool?,
      adminGraphqlApiId: json['admin_graphql_api_id'] as String?,
    );

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'title': instance.title,
      'price': instance.price,
      'sku': instance.sku,
      'position': instance.position,
      'option1': instance.option1,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'taxable': instance.taxable,
      'grams': instance.grams,
      'weight': instance.weight,
      'inventory_item_id': instance.inventoryItemId,
      'inventory_quantity': instance.inventoryQuantity,
      'old_inventory_quantity': instance.oldInventoryQuantity,
      'requires_shipping': instance.requiresShipping,
      'admin_graphql_api_id': instance.adminGraphqlApiId,
    };

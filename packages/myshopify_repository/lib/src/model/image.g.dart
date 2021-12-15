// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: json['id'] as int?,
      productId: json['product_id'] as int?,
      position: json['position'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      src: json['src'] as String?,
      adminGraphqlApiId: json['admin_graphql_api_id'] as String?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'position': instance.position,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'width': instance.width,
      'height': instance.height,
      'src': instance.src,
      'admin_graphql_api_id': instance.adminGraphqlApiId,
    };

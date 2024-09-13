// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItemRequest _$ProductItemRequestFromJson(Map<String, dynamic> json) =>
    ProductItemRequest(
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String,
      sku: json['sku'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      weight: json['weight'] as String,
      width: json['width'] as String,
      length: json['length'] as String,
      height: json['height'] as String,
      image: json['image'] as String,
      price: json['harga'] as String,
    );

Map<String, dynamic> _$ProductItemRequestToJson(ProductItemRequest instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'sku': instance.sku,
      'name': instance.name,
      'description': instance.description,
      'weight': instance.weight,
      'width': instance.width,
      'length': instance.length,
      'height': instance.height,
      'image': instance.image,
      'harga': instance.price,
    };

ProductItemResponse _$ProductItemResponseFromJson(Map<String, dynamic> json) =>
    ProductItemResponse(
      id: json['_id'] as String,
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String,
      sku: json['sku'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      weight: json['weight'] as String,
      width: json['width'] as String,
      length: json['length'] as String,
      height: json['height'] as String,
      image: json['image'] as String,
      price: json['harga'] as String,
    );

Map<String, dynamic> _$ProductItemResponseToJson(
        ProductItemResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'sku': instance.sku,
      'name': instance.name,
      'description': instance.description,
      'weight': instance.weight,
      'width': instance.width,
      'length': instance.length,
      'height': instance.height,
      'image': instance.image,
      'harga': instance.price,
    };

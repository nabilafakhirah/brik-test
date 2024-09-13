import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductItemRequest {
  ProductItemRequest({
    required this.categoryId,
    required this.categoryName,
    required this.sku,
    required this.name,
    required this.description,
    required this.weight,
    required this.width,
    required this.length,
    required this.height,
    required this.image,
    required this.price,
  });

  factory ProductItemRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductItemRequestFromJson(json);

  final String categoryId;
  final String categoryName;
  final String sku;
  final String name;
  final String description;
  final String weight;
  final String width;
  final String length;
  final String height;
  final String image;

  @JsonKey(name: 'harga')
  final String price;

  Map<String, dynamic> toJson() => _$ProductItemRequestToJson(this);
}

@JsonSerializable()
class ProductItemResponse {
  ProductItemResponse({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.sku,
    required this.name,
    required this.description,
    required this.weight,
    required this.width,
    required this.length,
    required this.height,
    required this.image,
    required this.price,
  });

  factory ProductItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductItemResponseFromJson(json);

  @JsonKey(name: '_id')
  final String id;
  final String categoryId;
  final String categoryName;
  final String sku;
  final String name;
  final String description;
  final String weight;
  final String width;
  final String length;
  final String height;
  final String image;

  @JsonKey(name: 'harga')
  final String price;

  Map<String, dynamic> toJson() => _$ProductItemResponseToJson(this);
}
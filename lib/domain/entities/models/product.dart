import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    int? id,
    String? title,
    num? price,
    String? category,
    String? description,
    String? image,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class CartProductModel with _$CartProductModel {
  factory CartProductModel({
    int? productId,
    int? quantity,
  }) = _CartProductModel;

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icecommercialpowertest/domain/entities/models/product.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class CartModel with _$CartModel {
  factory CartModel({
    int? id,
    int? userId,
    String? date,
    List<CartProductModel>? products,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}

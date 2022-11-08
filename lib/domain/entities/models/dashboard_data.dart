import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icecommercialpowertest/domain/entities/models/product.dart';

part 'dashboard_data.freezed.dart';
part 'dashboard_data.g.dart';

@freezed
class DashBoardData with _$DashBoardData {
  factory DashBoardData({
    List<String>? categories,
    List<ProductModel>? products,
  }) = _DashBoardData;
  factory DashBoardData.fromJson(Map<String, dynamic> json) =>
      _$DashBoardDataFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../product/data/models/product_model.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    required String id,
    required ProductModel product,
    required int quantity,
    String? selectedColor,
    String? selectedSize,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}

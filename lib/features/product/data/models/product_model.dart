import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String name,
    required String description,
    required double price,
    required List<String> images,
    required String category,
    required int stock,
    required double rating,
    required int reviewCount,
    @Default(null) double? discount,
    @Default([]) List<String> colors,
    @Default([]) List<String> sizes,
    @Default([]) List<String> features,
    @Default(false) bool isFavorite,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

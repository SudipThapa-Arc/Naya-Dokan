// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] as String,
      stock: (json['stock'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      discount: (json['discount'] as num?)?.toDouble() ?? null,
      colors: (json['colors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sizes:
          (json['sizes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'images': instance.images,
      'category': instance.category,
      'stock': instance.stock,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'discount': instance.discount,
      'colors': instance.colors,
      'sizes': instance.sizes,
      'features': instance.features,
      'isFavorite': instance.isFavorite,
    };

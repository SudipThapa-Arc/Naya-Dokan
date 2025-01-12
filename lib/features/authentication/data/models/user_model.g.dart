// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String?,
      favorites: (json['favorites'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      shippingAddress:
          json['shippingAddress'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'favorites': instance.favorites,
      'shippingAddress': instance.shippingAddress,
    };

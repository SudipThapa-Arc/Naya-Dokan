// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      id: json['id'] as String,
      productId: json['productId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'userId': instance.userId,
      'userName': instance.userName,
      'rating': instance.rating,
      'comment': instance.comment,
      'date': instance.date.toIso8601String(),
    };

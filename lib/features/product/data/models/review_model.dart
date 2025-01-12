import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    required String id,
    required String productId,
    required String userId,
    required String userName,
    required int rating,
    required String comment,
    required DateTime date,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  static ReviewModel fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ReviewModel(
      id: doc.id,
      productId: data['productId'] as String,
      userId: data['userId'] as String,
      userName: data['userName'] as String,
      rating: data['rating'] as int,
      comment: data['comment'] as String,
      date: (data['date'] as Timestamp).toDate(),
    );
  }
}

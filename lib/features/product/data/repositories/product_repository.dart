import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';
import '../models/review_model.dart';

class ProductRepository {
  final FirebaseFirestore _firestore;

  ProductRepository(this._firestore);

  Future<List<ProductModel>> getProducts({String? category}) async {
    try {
      Query query = _firestore.collection('products');

      if (category != null) {
        query = query.where('category', isEqualTo: category);
      }

      final snapshot = await query.get();
      return snapshot.docs
          .map((doc) =>
              ProductModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw 'Failed to load products: $e';
    }
  }

  Future<ProductModel> getProductById(String id) async {
    try {
      final doc = await _firestore.collection('products').doc(id).get();
      if (!doc.exists) {
        throw 'Product not found';
      }
      return ProductModel.fromJson(doc.data()!);
    } catch (e) {
      throw 'Failed to load product: $e';
    }
  }

  Future<List<String>> getCategories() async {
    try {
      final snapshot = await _firestore.collection('categories').get();
      return snapshot.docs.map((doc) => doc.data()['name'] as String).toList();
    } catch (e) {
      throw 'Failed to load categories: $e';
    }
  }

  Future<List<ReviewModel>> getProductReviews(String productId) async {
    try {
      final snapshot = await _firestore
          .collection('reviews')
          .where('productId', isEqualTo: productId)
          .orderBy('date', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => ReviewModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw 'Failed to load reviews: $e';
    }
  }
}

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository(FirebaseFirestore.instance);
});

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../product/data/models/product_model.dart';
import '../models/cart_item_model.dart';

class CartRepository {
  final FirebaseFirestore _firestore;

  CartRepository(this._firestore);

  Future<List<CartItemModel>> getCartItems(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('cart')
          .get();

      return Future.wait(
        snapshot.docs.map((doc) async {
          final data = doc.data();
          final productDoc = await _firestore
              .collection('products')
              .doc(data['productId'] as String)
              .get();

          return CartItemModel(
            id: doc.id,
            product: ProductModel.fromJson(productDoc.data()!),
            quantity: data['quantity'] as int,
            selectedColor: '',
          );
        }).toList(),
      );
    } catch (e) {
      throw 'Failed to load cart items: $e';
    }
  }

  Future<void> addToCart(String userId, String productId) async {
    try {
      final cartRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc(productId);

      final doc = await cartRef.get();
      if (doc.exists) {
        await cartRef.update({
          'quantity': FieldValue.increment(1),
        });
      } else {
        await cartRef.set({
          'productId': productId,
          'quantity': 1,
        });
      }
    } catch (e) {
      throw 'Failed to add item to cart: $e';
    }
  }

  Future<void> updateQuantity(
    String userId,
    String productId,
    int quantity,
  ) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc(productId)
          .update({'quantity': quantity});
    } catch (e) {
      throw 'Failed to update quantity: $e';
    }
  }

  Future<void> removeFromCart(String userId, String productId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('cart')
          .doc(productId)
          .delete();
    } catch (e) {
      throw 'Failed to remove item from cart: $e';
    }
  }
}

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepository(FirebaseFirestore.instance);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/cart/data/models/cart_item_model.dart';
import '../features/product/data/models/product_model.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, AsyncValue<List<CartItemModel>>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<AsyncValue<List<CartItemModel>>> {
  CartNotifier() : super(const AsyncValue.data([]));

  void addToCart(
    ProductModel product, {
    int quantity = 1,
    String? selectedColor,
    String? selectedSize,
  }) {
    final currentState = state.value ?? [];
    final existingIndex = currentState.indexWhere((item) =>
        item.product.id == product.id &&
        item.selectedColor == selectedColor &&
        item.selectedSize == selectedSize);

    if (existingIndex >= 0) {
      state = AsyncValue.data([
        ...currentState.sublist(0, existingIndex),
        currentState[existingIndex].copyWith(
          quantity: currentState[existingIndex].quantity + quantity,
        ),
        ...currentState.sublist(existingIndex + 1),
      ]);
    } else {
      state = AsyncValue.data([
        ...currentState,
        CartItemModel(
          id: DateTime.now().toString(),
          product: product,
          quantity: quantity,
          selectedColor: selectedColor,
          selectedSize: selectedSize,
        ),
      ]);
    }
  }

  void removeFromCart(String cartItemId) {
    state = AsyncValue.data(
        state.value!.where((item) => item.id != cartItemId).toList());
  }

  void updateQuantity(String cartItemId, int quantity) {
    state = AsyncValue.data([
      for (final item in state.value ?? [])
        if (item.id == cartItemId) item.copyWith(quantity: quantity) else item,
    ]);
  }

  void clearCart() {
    state = AsyncValue.data([]);
  }

  double get totalAmount {
    return (state.value ?? []).fold(
      0,
      (total, item) => total + (item.product.price * item.quantity),
    );
  }

  checkout() {}
}

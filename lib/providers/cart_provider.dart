import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/cart/data/models/cart_item_model.dart';
import '../features/cart/data/repositories/cart_repository.dart';
import '../features/product/data/models/product_model.dart';
import 'auth_provider.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, AsyncValue<List<CartItemModel>>>((ref) {
  final repository = ref.watch(cartRepositoryProvider);
  final auth = ref.watch(authStateProvider);

  return CartNotifier(repository, auth.value?.id ?? '');
});

class CartNotifier extends StateNotifier<AsyncValue<List<CartItemModel>>> {
  final CartRepository _repository;
  final String _userId;

  CartNotifier(this._repository, this._userId)
      : super(const AsyncValue.loading()) {
    if (_userId.isNotEmpty) {
      loadCart();
    }
  }

  Future<void> loadCart() async {
    try {
      state = const AsyncValue.loading();
      final items = await _repository.getCartItems(_userId);
      state = AsyncValue.data(items);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addToCart(ProductModel product) async {
    try {
      await _repository.addToCart(_userId, product.id);
      loadCart();
    } catch (e) {
      state = AsyncValue.error(e, state.stackTrace ?? StackTrace.current);
    }
  }

  Future<void> updateQuantity(String productId, int quantity) async {
    try {
      await _repository.updateQuantity(_userId, productId, quantity);
      loadCart();
    } catch (e) {
      state = AsyncValue.error(e, state.stackTrace ?? StackTrace.current);
    }
  }

  Future<void> removeFromCart(String productId) async {
    try {
      await _repository.removeFromCart(_userId, productId);
      loadCart();
    } catch (e) {
      state = AsyncValue.error(e, state.stackTrace ?? StackTrace.current);
    }
  }

  double get totalAmount {
    return state.value?.fold<double>(
          0,
          (total, item) => total + (item.product.price * item.quantity),
        ) ??
        0;
  }

  void clearCart() {
    state = const AsyncValue.data([]);
  }
}

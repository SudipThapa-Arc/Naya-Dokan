import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/product/data/repositories/product_repository.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<String>>((ref) {
  return FavoritesNotifier(ref.watch(productRepositoryProvider));
});

class FavoritesNotifier extends StateNotifier<List<String>> {
  final ProductRepository _repository;

  FavoritesNotifier(this._repository) : super([]);

  Future<void> toggleFavorite(String productId) async {
    try {
      if (state.contains(productId)) {
        state = state.where((id) => id != productId).toList();
      } else {
        state = [...state, productId];
      }
      await _repository.setFavorite(productId, state.contains(productId));
    } catch (e) {
      // Revert on error
      if (state.contains(productId)) {
        state = state.where((id) => id != productId).toList();
      } else {
        state = [...state, productId];
      }
      rethrow;
    }
  }
}

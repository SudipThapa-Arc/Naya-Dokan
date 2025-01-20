import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: unused_import
import '../features/product/data/models/product_model.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<String>>(
  (ref) => FavoritesNotifier(),
);

final recentlyViewedProvider =
    StateNotifierProvider<RecentlyViewedNotifier, List<String>>(
  (ref) => RecentlyViewedNotifier(),
);

class FavoritesNotifier extends StateNotifier<List<String>> {
  FavoritesNotifier() : super([]);

  void toggleFavorite(String productId) {
    state = state.contains(productId)
        ? state.where((id) => id != productId).toList()
        : [...state, productId];
  }
}

class RecentlyViewedNotifier extends StateNotifier<List<String>> {
  RecentlyViewedNotifier() : super([]);

  void addToRecentlyViewed(String productId) {
    state = [
      productId,
      ...state.where((id) => id != productId),
    ].take(10).toList();
  }
}

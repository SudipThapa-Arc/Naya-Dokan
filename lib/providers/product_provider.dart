import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/product/data/models/product_model.dart';
import '../features/product/data/repositories/product_repository.dart';

final selectedCategoryProvider = StateProvider<String?>((ref) => null);
final selectedSizeProvider = StateProvider<String?>((ref) => null);

// Add a provider to get unique categories
final uniqueCategoriesProvider = FutureProvider<List<String>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  final categories = await repository.getCategories();
  // Add 'All' category and ensure uniqueness
  return [
    'All',
    ...{...categories}
  ];
});

final productsProvider = FutureProvider<List<ProductModel>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);

  if (selectedCategory == null || selectedCategory == 'All') {
    return repository.getProducts();
  }
  return repository.getProducts(category: selectedCategory);
});

final categoriesProvider = FutureProvider<List<String>>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getCategories();
});

final productDetailsProvider =
    FutureProvider.family<ProductModel, String>((ref, id) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getProductById(id);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/product/data/models/product_model.dart';
import '../features/product/data/repositories/product_repository.dart';

final selectedCategoryProvider = StateProvider<String?>((ref) => null);

final productsProvider = FutureProvider<List<ProductModel>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
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

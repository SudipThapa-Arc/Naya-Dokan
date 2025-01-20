import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/product/data/models/product_model.dart';
import 'product_provider.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider<List<ProductModel>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  final products = await ref.watch(productsProvider.future);

  if (query.isEmpty) return [];

  return products.where((product) {
    final searchLower = query.toLowerCase();
    return product.name.toLowerCase().contains(searchLower) ||
        product.description.toLowerCase().contains(searchLower) ||
        product.category.toLowerCase().contains(searchLower);
  }).toList();
});

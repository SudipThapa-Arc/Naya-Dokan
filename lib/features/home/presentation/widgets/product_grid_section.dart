import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/product_provider.dart';
import '../../../product/presentation/widgets/product_card.dart';

class ProductGridSection extends ConsumerWidget {
  const ProductGridSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return productsAsync.when(
      data: (products) {
        final filteredProducts = selectedCategory == 'All' ||
                selectedCategory == null
            ? products
            : products.where((p) => p.category == selectedCategory).toList();

        return SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ProductCard(
                product: filteredProducts[index],
              ),
              childCount: filteredProducts.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
          ),
        );
      },
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SliverToBoxAdapter(
        child: Center(child: Text('Failed to load products')),
      ),
    );
  }
}

// ignore_for_file: unused_import

import 'package:e_commerce/features/product/presentation/widgets/category_shimmer.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/themes.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../providers/product_provider.dart';
import '../widgets/product_card.dart';
import '../widgets/product_list_item.dart';
import '../widgets/category_filter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          // Custom App Bar with Search
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 120,
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Discover',
                          style: GoogleFonts.spaceMono(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textColor,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.shopping_cart_outlined),
                          onPressed: () => context.push('/cart'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SearchBar(
                      hintText: 'Search products...',
                      leading: const Icon(Icons.search),
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Categories
          SliverToBoxAdapter(
            child: categoriesAsync.when(
              data: (categories) => CategoryFilter(categories: categories),
              loading: () => const CategoryShimmer(),
              error: (_, __) => const Center(
                child: Text('Failed to load categories'),
              ),
            ),
          ),

          // Products Grid
          productsAsync.when(
            data: (products) => SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ProductCard(
                    product: products[index],
                  ),
                  childCount: products.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 1200
                      ? 4
                      : MediaQuery.of(context).size.width > 800
                          ? 3
                          : 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
              ),
            ),
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (_, __) => const SliverFillRemaining(
              child: Center(child: Text('Failed to load products')),
            ),
          ),
        ],
      ),
    );
  }
}

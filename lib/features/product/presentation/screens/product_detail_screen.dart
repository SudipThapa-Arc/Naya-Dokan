// ignore_for_file: unused_import, unnecessary_null_comparison

import 'package:e_commerce/core/constants/themes.dart';
import 'package:e_commerce/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/helpers.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../providers/product_provider.dart';
import '../../../../providers/cart_provider.dart';
import '../widgets/product_image_slider.dart';
import '../widgets/product_reviews.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/color_dot.dart';
import '../widgets/favorite_button.dart';

class ProductDetailScreen extends ConsumerWidget {
  final String productId;

  const ProductDetailScreen({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productDetailsProvider(productId));

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: productAsync.when(
        data: (product) => CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 400,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: ProductImageSlider(images: product.images),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        FavoriteButton(
                          productId: product.id,
                          isFavorite: product.isFavorite,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Helpers.formatPrice(product.price),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    if (product.colors.isNotEmpty) ...[
                      Text(
                        'Colors',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: product.colors
                            .map((color) => ColorDot(color: color))
                            .toList(),
                      ),
                    ],
                    if (product.sizes != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        'Sizes',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: product.sizes
                            .map((size) => ChoiceChip(
                                  label: Text(size),
                                  selected: false,
                                  onSelected: (selected) {
                                    if (selected) {
                                      ref
                                          .read(selectedSizeProvider.notifier)
                                          .state = size;
                                    } else {
                                      ref
                                          .read(selectedSizeProvider.notifier)
                                          .state = null;
                                    }
                                  },
                                ))
                            .toList(),
                      ),
                    ],
                    const SizedBox(height: 16),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(product.description),
                    if (product.features != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        'Features',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Column(
                        children: product.features
                            .map((feature) => ListTile(
                                  leading: const Icon(Icons.check_circle),
                                  title: Text(feature),
                                  dense: true,
                                ))
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Failed to load product')),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/themes.dart';
import '../../../../core/widgets/sliver_header_delegate.dart';
import '../../../../providers/search_provider.dart';
import '../widgets/featured_products.dart';
import '../widgets/category_filter.dart';
import '../widgets/product_grid_section.dart';
import '../widgets/search_bar.dart';
import '../widgets/search_results.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.white,
              expandedHeight: 80,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: const SearchBarWidget(),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderDelegate(
                minHeight: 60,
                maxHeight: 60,
                child: Container(
                  color: Colors.white,
                  child: const CategoryFilter(),
                ),
              ),
            ),
            if (searchQuery.isEmpty) ...[
              const SliverPadding(
                padding: EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: FeaturedProducts(),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                sliver: ProductGridSection(),
              ),
            ] else
              const SliverToBoxAdapter(
                child: Expanded(
                  child: SearchResults(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

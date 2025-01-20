import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/product_provider.dart';
import '../../../../core/constants/themes.dart';

class CategoryFilter extends ConsumerWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final categoriesAsync = ref.watch(uniqueCategoriesProvider);

    return Container(
      height: 60,
      color: Colors.white,
      child: categoriesAsync.when(
        data: (categories) => ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            final isSelected = category == selectedCategory ||
                (category == 'All' && selectedCategory == null);

            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: Text(category),
                selected: isSelected,
                onSelected: (_) {
                  ref.read(selectedCategoryProvider.notifier).state =
                      category == 'All' ? null : category;
                },
                backgroundColor: Colors.white,
                selectedColor: AppTheme.primaryColor.withOpacity(0.1),
                labelStyle: TextStyle(
                  color:
                      isSelected ? AppTheme.primaryColor : AppTheme.textColor,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color:
                        isSelected ? AppTheme.primaryColor : Colors.grey[300]!,
                  ),
                ),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) =>
            const Center(child: Text('Failed to load categories')),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/product_provider.dart';

class CategoryFilter extends StatelessWidget {
  final List<String> categories;

  const CategoryFilter({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final selectedCategory = ref.watch(selectedCategoryProvider);

        return Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length + 1, // +1 for "All" category
            itemBuilder: (context, index) {
              final isAll = index == 0;
              final category = isAll ? 'All' : categories[index - 1];
              final isSelected = isAll
                  ? selectedCategory == null
                  : selectedCategory == category;

              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Material(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      ref.read(selectedCategoryProvider.notifier).state =
                          isAll ? null : category;
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? Colors.transparent
                              : Colors.grey[300]!,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryBar extends ConsumerWidget {
  const CategoryBar({super.key});

  final categories = const [
    'All',
    'Electronics',
    'Beauty',
    'Books',
    'Clothing',
    'Kitchen',
    'Kids',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: false,
              onSelected: (selected) {
                if (selected) {
                  // TODO: Add category filter provider
                  debugPrint('Selected category: ${categories[index]}');
                }
              },
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterOptionsSheet extends ConsumerWidget {
  const FilterOptionsSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Sort By', style: Theme.of(context).textTheme.titleLarge),
          ListTile(
            title: const Text('Price: Low to High'),
            onTap: () => Navigator.pop(context, 'price_asc'),
          ),
          ListTile(
            title: const Text('Price: High to Low'),
            onTap: () => Navigator.pop(context, 'price_desc'),
          ),
          ListTile(
            title: const Text('Popularity'),
            onTap: () => Navigator.pop(context, 'popularity'),
          ),
          ListTile(
            title: const Text('Rating'),
            onTap: () => Navigator.pop(context, 'rating'),
          ),
        ],
      ),
    );
  }
}

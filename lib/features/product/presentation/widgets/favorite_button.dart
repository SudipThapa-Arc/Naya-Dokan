import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/themes.dart';
import '../../../../providers/favorites_provider.dart';

class FavoriteButton extends ConsumerWidget {
  final String productId;
  final bool isFavorite;

  const FavoriteButton({
    super.key,
    required this.productId,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? AppTheme.primaryColor : Colors.grey,
      ),
      onPressed: () async {
        try {
          await ref.read(favoritesProvider.notifier).toggleFavorite(productId);
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to update favorite')),
            );
          }
        }
      },
    );
  }
}

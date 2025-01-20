// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/cart_item_model.dart';
import '../../../../core/utils/helpers.dart';
import '../../../../providers/cart_provider.dart';
import 'quantity_control.dart';

class CartItemCard extends ConsumerWidget {
  final CartItemModel cartItem;

  const CartItemCard({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                cartItem.product.images.first,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.product.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    Helpers.formatPrice(cartItem.product.price),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  if (cartItem.selectedColor != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Color: ${cartItem.selectedColor}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                  if (cartItem.selectedSize != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Size: ${cartItem.selectedSize}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ],
              ),
            ),
            // Quantity Controls
            Column(
              children: [
                QuantityControl(
                  quantity: cartItem.quantity,
                  onChanged: (quantity) {
                    if (quantity == 0) {
                      ref
                          .read(cartProvider.notifier)
                          .removeFromCart(cartItem.id);
                    } else {
                      ref
                          .read(cartProvider.notifier)
                          .updateQuantity(cartItem.id, quantity);
                    }
                  },
                ),
                const SizedBox(height: 8),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    ref.read(cartProvider.notifier).removeFromCart(cartItem.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

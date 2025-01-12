// ignore_for_file: unused_import

import 'package:e_commerce/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../providers/cart_provider.dart';
import '../widgets/cart_item_card.dart';
import '../../../../core/utils/helpers.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/cart_summary.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
          style: GoogleFonts.spaceMono(
            fontWeight: FontWeight.bold,
            color: AppTheme.textColor,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: cartAsync.when(
        data: (cartItems) {
          if (cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    text: 'Start Shopping',
                    onPressed: () => context.go('/'),
                    isOutlined: true,
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CartItemCard(
                      item: cartItems[index],
                      onUpdateQuantity: (quantity) {
                        ref.read(cartProvider.notifier).updateQuantity(
                              cartItems[index].product.id,
                              quantity,
                            );
                      },
                      onRemove: () {
                        ref.read(cartProvider.notifier).removeFromCart(
                              cartItems[index].product.id,
                            );
                      },
                    ),
                  ),
                ),
              ),
              CartSummary(items: cartItems),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(
          child: Text('Failed to load cart'),
        ),
      ),
    );
  }
}

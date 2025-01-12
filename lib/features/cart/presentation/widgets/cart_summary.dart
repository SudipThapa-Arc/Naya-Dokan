import 'package:e_commerce/core/utils/helpers.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/cart/data/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/themes.dart';

class CartSummary extends StatelessWidget {
  final List<CartItemModel> items;

  const CartSummary({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final subtotal = items.fold<double>(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
    final shipping = 5.99;
    final total = subtotal + shipping;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SummaryRow(
              label: 'Subtotal',
              value: Helpers.formatPrice(subtotal),
            ),
            const SizedBox(height: 8),
            _SummaryRow(
              label: 'Shipping',
              value: Helpers.formatPrice(shipping),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(),
            ),
            _SummaryRow(
              label: 'Total',
              value: Helpers.formatPrice(total),
              isTotal: true,
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Proceed to Checkout',
              onPressed: () => context.push('/checkout'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: AppTheme.textColor,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? AppTheme.primaryColor : AppTheme.textColor,
          ),
        ),
      ],
    );
  }
}

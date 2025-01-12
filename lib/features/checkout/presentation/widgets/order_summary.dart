import 'package:e_commerce/features/cart/data/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/themes.dart';
import '../../../../core/utils/helpers.dart';

class OrderSummary extends StatelessWidget {
  final List<CartItemModel> items;

  const OrderSummary({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final subtotal = items.fold<double>(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
    final shipping = 5.99;
    final total = subtotal + shipping;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...items.map((item) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.network(item.product.images.first),
              title: Text(item.product.name),
              subtitle: Text('Quantity: ${item.quantity}'),
              trailing:
                  Text(Helpers.formatPrice(item.product.price * item.quantity)),
            )),
        const Divider(),
        _SummaryRow(label: 'Subtotal', value: Helpers.formatPrice(subtotal)),
        const SizedBox(height: 8),
        _SummaryRow(label: 'Shipping', value: Helpers.formatPrice(shipping)),
        const SizedBox(height: 8),
        _SummaryRow(
          label: 'Total',
          value: Helpers.formatPrice(total),
          isTotal: true,
        ),
      ],
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

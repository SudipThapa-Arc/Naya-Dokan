import 'package:e_commerce/features/checkout/presentation/widgets/card_details_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/themes.dart';

class PaymentMethodSelector extends StatefulWidget {
  const PaymentMethodSelector({super.key});

  @override
  State<PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  String _selectedMethod = 'card';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PaymentMethodTile(
          title: 'Credit/Debit Card',
          subtitle: 'Pay with Visa, Mastercard, etc.',
          icon: Icons.credit_card,
          value: 'card',
          groupValue: _selectedMethod,
          onChanged: (value) => setState(() => _selectedMethod = value!),
        ),
        const SizedBox(height: 16),
        _PaymentMethodTile(
          title: 'PayPal',
          subtitle: 'Pay with your PayPal account',
          icon: Icons.paypal,
          value: 'paypal',
          groupValue: _selectedMethod,
          onChanged: (value) => setState(() => _selectedMethod = value!),
        ),
        if (_selectedMethod == 'card') ...[
          const SizedBox(height: 24),
          const CardDetailsForm(),
        ],
      ],
    );
  }
}

class _PaymentMethodTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const _PaymentMethodTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color:
              value == groupValue ? AppTheme.primaryColor : Colors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: RadioListTile<String>(
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: AppTheme.textColor,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.inter(
            color: Colors.grey[600],
          ),
        ),
        secondary: Icon(
          icon,
          color: value == groupValue ? AppTheme.primaryColor : Colors.grey[600],
        ),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: AppTheme.primaryColor,
      ),
    );
  }
}

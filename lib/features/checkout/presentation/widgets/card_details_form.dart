import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CardDetailsForm extends StatelessWidget {
  const CardDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: TextEditingController(),
          label: 'Card Number',
          hint: '1234 5678 9012 3456',
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: TextEditingController(),
                label: 'Expiry Date',
                hint: 'MM/YY',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextField(
                controller: TextEditingController(),
                label: 'CVV',
                hint: '123',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

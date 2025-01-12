import 'package:e_commerce/features/checkout/presentation/widgets/order_success_dialog.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/order_summary.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/processing_payment_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/themes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../providers/cart_provider.dart';
import '../widgets/payment_method_selector.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartAsync = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Checkout',
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
            return const Center(child: Text('Your cart is empty'));
          }

          return Stepper(
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep < 2) {
                setState(() => _currentStep++);
              } else {
                _processPayment();
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() => _currentStep--);
              }
            },
            controlsBuilder: (context, details) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: _currentStep == 2 ? 'Place Order' : 'Continue',
                        onPressed: details.onStepContinue,
                      ),
                    ),
                    if (_currentStep > 0) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomButton(
                          text: 'Back',
                          onPressed: details.onStepCancel,
                          isOutlined: true,
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
            steps: [
              Step(
                title: Text(
                  'Shipping Address',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                ),
                content: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _addressController,
                        label: 'Street Address',
                        hint: 'Enter your street address',
                        validator: (value) =>
                            value?.isEmpty ?? true ? 'Required' : null,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _cityController,
                              label: 'City',
                              hint: 'Enter city',
                              validator: (value) =>
                                  value?.isEmpty ?? true ? 'Required' : null,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustomTextField(
                              controller: _stateController,
                              label: 'State',
                              hint: 'Enter state',
                              validator: (value) =>
                                  value?.isEmpty ?? true ? 'Required' : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _zipController,
                        label: 'ZIP Code',
                        hint: 'Enter ZIP code',
                        validator: (value) =>
                            value?.isEmpty ?? true ? 'Required' : null,
                      ),
                    ],
                  ),
                ),
                isActive: _currentStep >= 0,
              ),
              Step(
                title: Text(
                  'Payment Method',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                ),
                content: const PaymentMethodSelector(),
                isActive: _currentStep >= 1,
              ),
              Step(
                title: Text(
                  'Order Summary',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                ),
                content: OrderSummary(items: cartItems),
                isActive: _currentStep >= 2,
              ),
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

  void _processPayment() async {
    if (!_formKey.currentState!.validate()) {
      setState(() => _currentStep = 0);
      return;
    }

    try {
      // Show loading dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const ProcessingPaymentDialog(),
      );

      // Simulate payment processing
      await Future.delayed(const Duration(seconds: 2));

      // Close loading dialog
      if (mounted) Navigator.pop(context);

      // Show success dialog
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const OrderSuccessDialog(),
        );
      }

      // Clear cart
      ref.read(cartProvider.notifier).clearCart();

      // Navigate to home after 2 seconds
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) context.go('/');
    } catch (e) {
      // Handle payment error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment failed: $e')),
        );
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../services/cash_payment.dart';
import '../../services/credit_payment.dart';
import '../../services/payment_processor.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/payment_button.dart';
import '../widgets/payment_method_card.dart';
import 'payment_success_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  bool _isLoading = false;
  PaymentType _selectedPaymentType = PaymentType.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Payment'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              context.watch<ThemeProvider>().isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Payment Method Selection
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Payment Method',
                    style: AppTextStyles.getHeadline2(context),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: PaymentMethodCard(
                          title: 'Cash Payment',
                          icon: Icons.money,
                          isSelected: _selectedPaymentType == PaymentType.cash,
                          onTap: () {
                            setState(() {
                              _selectedPaymentType = PaymentType.cash;
                              _clearControllers();
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: PaymentMethodCard(
                          title: 'Card Payment',
                          icon: Icons.credit_card,
                          isSelected: _selectedPaymentType == PaymentType.card,
                          onTap: () {
                            setState(() {
                              _selectedPaymentType = PaymentType.card;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Payment Form
            if (_selectedPaymentType != PaymentType.none)
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Details',
                          style: AppTextStyles.getHeadline2(context),
                        ),
                        const SizedBox(height: 24),
                        // Amount Field
                        CustomTextField(
                          label: 'Amount',
                          controller: _amountController,
                          prefixText: '\$',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter an amount';
                            }
                            if (double.tryParse(value!) == null) {
                              return 'Please enter a valid amount';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        // Card Payment Fields
                        if (_selectedPaymentType == PaymentType.card) ...[
                          CustomTextField(
                            label: 'Card Number',
                            controller: _cardNumberController,
                            keyboardType: TextInputType.number,
                            prefixIcon: const Icon(Icons.credit_card),
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please enter card number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  label: 'Expiry Date',
                                  controller: _expiryController,
                                  hint: 'MM/YY',
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CustomTextField(
                                  label: 'CVV',
                                  controller: _cvvController,
                                  obscureText: true,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: PaymentButton(
                            text: _selectedPaymentType == PaymentType.cash
                                ? 'Pay with Cash'
                                : 'Pay with Card',
                            icon: _selectedPaymentType == PaymentType.cash
                                ? Icons.money
                                : Icons.credit_card,
                            isLoading: _isLoading,
                            onPressed: _processPayment,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _clearControllers() {
    _cardNumberController.clear();
    _expiryController.clear();
    _cvvController.clear();
  }

  Future<void> _processPayment() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final processor = PaymentProcessor(
        paymentMethod: _selectedPaymentType == PaymentType.cash
            ? CashPayment()
            : CreditPayment(
          cardNumber: _cardNumberController.text,
          expiryDate: _expiryController.text,
          cvv: _cvvController.text,
        ),
      );

      final result = await processor.processPayment(
        double.parse(_amountController.text),
      );

      if (result.success) {
        if (mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => PaymentSuccessScreen(
                amount: double.parse(_amountController.text),
                method: _selectedPaymentType == PaymentType.cash
                    ? 'Cash'
                    : 'Credit Card',
              ),
            ),
          );
        }
      } else {
        if (mounted) {
          _showErrorSnackBar(result.message ?? 'Payment failed');
        }
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar('Error: ${e.toString()}');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
}

enum PaymentType { none, cash, card }


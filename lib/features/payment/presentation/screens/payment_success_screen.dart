import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final double amount;
  final String method;

  const PaymentSuccessScreen({
    super.key,
    required this.amount,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: AppColors.success,
              size: 80,
            ),
            const SizedBox(height: 24),
            Text(
              'Payment Successful!',
              style: AppTextStyles.getHeadline1(context),
            ),
            const SizedBox(height: 16),
            Text(
              'Amount: \$${amount.toStringAsFixed(2)}',
              style: AppTextStyles.getBodyText1(context),
            ),
            Text(
              'Method: $method',
              style: AppTextStyles.getBodyText1(context),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Back to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
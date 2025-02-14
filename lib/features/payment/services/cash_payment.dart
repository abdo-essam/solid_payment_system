import '../data/models/payment_result.dart';
import '../domain/entities/payment_method.dart';
import 'dart:math';

class CashPayment implements PaymentMethod {
  @override
  Future<PaymentResult> processPayment(double amount) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate processing time

    final success = Random().nextBool(); // Simulate success/failure

    return PaymentResult(
      success: success,
      message: success ? 'Cash payment successful' : 'Cash payment failed',
      transactionId: 'CSH${DateTime.now().millisecondsSinceEpoch}',
    );
  }
}
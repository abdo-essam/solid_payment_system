import '../data/models/payment_result.dart';
import '../domain/entities/payment_method.dart';

class PaymentProcessor {
  final PaymentMethod paymentMethod;

  PaymentProcessor({required this.paymentMethod});

  Future<PaymentResult> processPayment(double amount) async {
    try {
      return await paymentMethod.processPayment(amount);
    } catch (e) {
      return PaymentResult(
        success: false,
        message: 'Payment processing failed: ${e.toString()}',
        transactionId: 'ERROR',
      );
    }
  }
}
import '../data/models/payment_result.dart';
import '../domain/entities/payment_method.dart';

class CreditPayment implements PaymentMethod {
  final String cardNumber;
  final String expiryDate;
  final String? cvv;

  CreditPayment({
    required this.cardNumber,
    required this.expiryDate,
    this.cvv,
  });

  @override
  Future<PaymentResult> processPayment(double amount) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate processing time

    // Basic validation
    if (!_isValidCardNumber(cardNumber) || !_isValidExpiryDate(expiryDate)) {
      return PaymentResult(
        success: false,
        message: 'Invalid card details',
        transactionId: 'FAILED',
      );
    }

    return PaymentResult(
      success: true,
      message: 'Credit card payment successful',
      transactionId: 'CC${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  bool _isValidCardNumber(String number) {
    return number.length >= 13 && number.length <= 19;
  }

  bool _isValidExpiryDate(String expiry) {
    if (!expiry.contains('/')) return false;

    final parts = expiry.split('/');
    if (parts.length != 2) return false;

    try {
      final month = int.parse(parts[0]);
      final year = int.parse(parts[1]);

      if (month < 1 || month > 12) return false;

      final now = DateTime.now();
      final expiryDate = DateTime(2000 + year, month);

      return expiryDate.isAfter(now);
    } catch (e) {
      return false;
    }
  }
}
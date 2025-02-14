import '../../data/models/payment_result.dart';

abstract class PaymentMethod {
  Future<PaymentResult> processPayment(double amount);
}
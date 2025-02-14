import '../../data/models/payment_result.dart';
import '../entities/payment_method.dart';

abstract class PaymentRepository {
  Future<PaymentResult> processPayment(double amount, PaymentMethod method);
}

class PaymentResult {
  final bool success;
  final String? message;
  final String transactionId;

  PaymentResult({
    required this.success,
    this.message,
    required this.transactionId,
  });
}
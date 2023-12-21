class PaymentIntendInputModel {
  final String amount;
  final String currency;
  final String cusomerId;

  PaymentIntendInputModel(
      {required this.cusomerId, required this.amount, required this.currency});

  toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': cusomerId
    };
  }
}

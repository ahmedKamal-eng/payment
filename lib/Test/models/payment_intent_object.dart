class PaymentIntentObject {
  final String id;
  final String clientSecret;

  PaymentIntentObject({required this.id, required this.clientSecret});

  factory PaymentIntentObject.fromJson(Map<String, dynamic> data) {
    return PaymentIntentObject(
        id: data['id'], clientSecret: data["client_secret"]);
  }
}

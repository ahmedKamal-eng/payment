import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:payment/core/utiles/api_keys.dart';

import 'Test/test_app.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  // runApp(const CheckoutApp());
  runApp(InitTestApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

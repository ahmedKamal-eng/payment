import 'package:flutter/material.dart';
import 'package:payment/core/utiles/styles.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, textAlign: TextAlign.center, style: Styles.style18),
          Text(value, style: Styles.style18Bold),
        ],
      ),
    );
  }
}

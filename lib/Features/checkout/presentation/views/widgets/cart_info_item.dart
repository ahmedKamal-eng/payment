import 'package:flutter/material.dart';
import 'package:payment/core/utiles/styles.dart';

class OrderInfoItem extends StatelessWidget {
  String title, value;
  OrderInfoItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
        Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
      ],
    );
  }
}

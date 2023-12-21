import 'package:flutter/material.dart';

import '../../../../../core/utiles/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
        Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
      ],
    );
    ;
  }
}

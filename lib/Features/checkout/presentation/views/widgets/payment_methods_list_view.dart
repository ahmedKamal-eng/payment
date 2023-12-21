import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/payment_method_item.dart';

import '../../../../../core/utiles/constants.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  List<String> paymentMethodsItems = [
    'assets/images/card.svg',
    'assets/images/paypal.svg'
  ];
  // int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                paymentMethodIndex = index;
                setState(() {});
              },
              child: PaymentMethodItem(
                isActive: paymentMethodIndex == index,
                image: paymentMethodsItems[index],
              ),
            ),
          );
        },
        itemCount: paymentMethodsItems.length,
      ),
    );
  }
}

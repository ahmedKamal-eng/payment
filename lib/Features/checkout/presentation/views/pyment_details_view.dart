import 'package:flutter/material.dart';
import 'package:payment/core/widgets/custom_app_bar.dart';

import 'widgets/pyment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Payment Details'),
      body: PaymentDetailsViewBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment/Features/checkout/presentation/manager/cubit/payment_cubit.dart';

import 'package:payment/Features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';

import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/total_price_widget.dart';

import 'cart_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset("assets/images/basket_image.png")),
          const SizedBox(
            height: 25,
          ),
          OrderInfoItem(
            title: 'Order Subtotal',
            value: '\$42.97',
          ),
          const SizedBox(
            height: 3,
          ),
          OrderInfoItem(
            title: 'Discount',
            value: '\$0',
          ),
          const SizedBox(
            height: 3,
          ),
          OrderInfoItem(
            title: 'Shipping',
            value: '\$8',
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffc7c7c7),
          ),
          const TotalPrice(title: 'Total', value: r'$50.97'),
          CustomButton(
            text: "Complete Payment",
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentDetailsView()));

              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  builder: (context) {
                    return BlocProvider(
                        create: (BuildContext context) {
                          return PaymentCubit(CheckoutRepoImpl());
                        },
                        child: PaymentMethodsBottomSheet());
                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}

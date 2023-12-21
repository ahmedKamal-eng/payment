import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/Features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment/Features/checkout/data/models/amount_model/details.dart';
import 'package:payment/Features/checkout/data/models/items_list_model/item.dart';
import 'package:payment/Features/checkout/data/models/items_list_model/items_list_model.dart';
import 'package:payment/Features/checkout/data/models/payment_intend_input_model.dart';
import 'package:payment/Features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:payment/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment/core/utiles/api_keys.dart';

import '../../../../../core/utiles/constants.dart';
import '../../../../../core/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(listener: (context, state) {
      if (state is PaymentSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return ThankYouView();
          }),
        );
      }

      if (state is PaymentFailure) {
        print(state.errMessage);
        Navigator.pop(context);
        SnackBar snackBar = SnackBar(content: Text(state.errMessage));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }, builder: (context, state) {
      return CustomButton(
          onTap: () {
            if (paymentMethodIndex == 0) {
              PaymentIntendInputModel paymentIntendInputModel =
                  PaymentIntendInputModel(
                      amount: '100',
                      currency: 'USD',
                      cusomerId: 'cus_P0vREJo9Wxz3ln');

              BlocProvider.of<PaymentCubit>(context).makePayment(
                  paymentIntentInputModel: paymentIntendInputModel);
            } else if (paymentMethodIndex == 1) {
              var amount = AmountModel(
                total: "100",
                currency: "USD",
                details: Details(
                    shipping: "0", shippingDiscount: 0, subtotal: "100"),
              );
              List<OrderItemModel> orders=[
                OrderItemModel(
                  currency: "USD",
                  name: "Apple",
                  price: "4",
                  quantity: 10
                ),
                OrderItemModel(
                  currency: "USD",
                  name: "Apple",
                  price: "5",
                  quantity:12
                )
              ];

              var itemList=ItemsListModel(orders: orders);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PaypalCheckoutView(
                  sandboxMode: true,
                  clientId: ApiKeys.clientId,
                  secretKey: ApiKeys.paypalSecretKey,
                  transactions:  [
                    {
                      "amount":amount.toJson(),
                      "description": "The payment transaction description.",
                      "item_list": itemList.toJson()
                    }
                  ],
                  note: "Contact us for any questions on your order.",
                  onSuccess: (Map params) async {
                    log("onSuccess: $params");
                    Navigator.pop(context);
                  },
                  onError: (error) {
                    log("onError: $error");
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    print('cancelled:');
                    Navigator.pop(context);
                  },
                ),
              ));
            }
          },
          isLoading: state is PaymentLoading ? true : false,
          text: 'Continue');
    });
  }
}

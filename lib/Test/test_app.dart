import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Test/models/payment_intent_object.dart';
import 'package:payment/core/utiles/api_keys.dart';
import 'package:payment/core/utiles/api_service.dart';

class InitTestApp extends StatelessWidget {
  const InitTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: TestApp(),
    );
  }
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          centerTitle: true,
          title: Text('Test'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                child: Text("Stripe Payment"),
                onPressed: () async {
                  try {
                    // 1- create payment intent
                    var response = await ApiService().post(
                        body: {'amount': '10000', 'currency': "USD"},
                        url: 'https://api.stripe.com/v1/payment_intents',
                        contentType: Headers.formUrlEncodedContentType,
                        token: ApiKeys.secretKey);
                    PaymentIntentObject paymentIntentObject =
                        PaymentIntentObject.fromJson(response.data);
                    print(paymentIntentObject.id);
                    //2-init payment sheet
                    await Stripe.instance.initPaymentSheet(
                      paymentSheetParameters: SetupPaymentSheetParameters(
                          paymentIntentClientSecret:
                              paymentIntentObject.clientSecret,
                          merchantDisplayName: 'ahmed kamal'),
                    );

                    //3-show payment sheet
                    await Stripe.instance.presentPaymentSheet();
                  } catch (e) {
                    print(e.toString() + "++++++++++++++++++++++");
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => PaypalCheckoutView(
                            sandboxMode: true,
                            clientId: ApiKeys.clientId,
                            secretKey: ApiKeys.paypalSecretKey,
                            transactions: const [
                              {
                                "amount": {
                                  "total": '100',
                                  "currency": "USD",
                                  "details": {
                                    "subtotal": '100',
                                    "shipping": '0',
                                    "shipping_discount": 0
                                  }
                                },
                                "description":
                                    "The payment transaction description.",
                                // "payment_options": {
                                //   "allowed_payment_method":
                                //       "INSTANT_FUNDING_SOURCE"
                                // },
                                "item_list": {
                                  "items": [
                                    {
                                      "name": "Apple",
                                      "quantity": 4,
                                      "price": '10',
                                      "currency": "USD"
                                    },
                                    {
                                      "name": "Pineapple",
                                      "quantity": 5,
                                      "price": '12',
                                      "currency": "USD"
                                    }
                                  ],

                                  // Optional
                                  //   "shipping_address": {
                                  //     "recipient_name": "Tharwat samy",
                                  //     "line1": "tharwat",
                                  //     "line2": "",
                                  //     "city": "tharwat",
                                  //     "country_code": "EG",
                                  //     "postal_code": "25025",
                                  //     "phone": "+00000000",
                                  //     "state": "ALex"
                                  //  },
                                }
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
                  },
                  child: Text('paypal payment')),
            ],
          ),
        ),
      )
    ;
  }
}
